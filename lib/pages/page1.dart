import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../services/cases.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../services/scaleroute.dart';
import '../services/sizeroute.dart';
import '../main.dart';
// import 'dart:async';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with WidgetsBindingObserver {
  AppLifecycleState _notification;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _notification = state;
    switch (state) {
      case AppLifecycleState.resumed:
        // setIndiaCases();
        Navigator.push(context, SizeRoute(page: SplashScreen()));
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        // SystemNavigator.pop(); //closes app when user leaves app
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  String total = 'Loading...';
  String active = 'Loading...';
  String death = 'Loading...';
  String recovered = 'Loading...';
  void setIndiaCases() async {
    // print('data loaded');
    IndiaCases instance = IndiaCases();
    await instance.getCases();

    setState(() {
      total = instance.totalCases;
      active = instance.activeCases;
      recovered = instance.recoveredCases;
      death = instance.deathCases;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (_notification == AppLifecycleState.resumed) {
      setIndiaCases();
    }
    setIndiaCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[800],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.amberAccent,
                    size: 30,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              );
            },
          ),
          elevation: 100,
          backgroundColor: Colors.grey[850],
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.amberAccent,
                  size: 30,
                ),
                tooltip: 'Refresh',
                onPressed: () {
                  // setIndiaCases();
                  Navigator.push(context, SizeRoute(page: SplashScreen()));
                },
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'CASES IN INDIA',
              style: TextStyle(
                fontFamily: 'ProximaNova',
                color: Colors.amberAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.8,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              accountName: Text(
                'COVID 19 Tracker',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontSize: 25,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('assets/circle-cropped.png'),
              ),
              accountEmail: Text(''),
            ),
            // SizedBox(height: 60),
            Container(
              decoration: BoxDecoration(
                color: Colors.red[100],
              ),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    letterSpacing: -0.5,
                    fontSize: 18,
                  ),
                ),
                selected: true,
                onTap: () {
                  // Navigator.pushNamed(context, '/');
                  Navigator.push(context, ScaleRoute(page: Page1()));
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'States',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'ProximaNova',
                  letterSpacing: -0.5,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/Page2');
                Navigator.push(context, ScaleRoute(page: Page2()));
              },
            ),
            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text(
                'Daily Cases',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'ProximaNova',
                  letterSpacing: -0.5,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/Page3');
                Navigator.push(context, ScaleRoute(page: Page3()));
              },
            ),
            ListTile(
              // leading: Icon(Icons.new_releases),
              title: Text(
                'Symptoms',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'ProximaNova',
                  letterSpacing: -0.5,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/Page3');
                Navigator.push(context, ScaleRoute(page: Page4()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            begin: const FractionalOffset(0.0, 0.5),
            end: const FractionalOffset(0.0, 1.3),
            colors: [
              Color(0xff240b36),
              Color(0xffc31432),
            ],
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: MediaQuery.of(context).size.height / 1.7,
            // height: 500,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                // color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 50.0, // soften the shadow
                  spreadRadius: 0.2, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        boxShadow: [
                          // color: Colors.white, //background color of box
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 50.0, // soften the shadow
                            spreadRadius: 0.2, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      width: 160,
                      height: 160,
                      child: Center(
                        child: Text(
                          'Confirmed\n$total',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue[600],
                        ),
                        boxShadow: [
                          // color: Colors.white, //background color of box
                          BoxShadow(
                            color: Colors.blue[600],
                            blurRadius: 50.0, // soften the shadow
                            spreadRadius: 0.2, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      width: 160,
                      height: 160,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Active\n$active',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green[500],
                        ),
                        boxShadow: [
                          // color: Colors.white, //background color of box
                          BoxShadow(
                            color: Colors.green[500],
                            blurRadius: 50.0, // soften the shadow
                            spreadRadius: 0.2, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.green[500],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      width: 160,
                      height: 160,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Recovered\n$recovered',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[800],
                        ),
                        boxShadow: [
                          // color: Colors.white, //background color of box
                          BoxShadow(
                            color: Colors.grey[800],
                            blurRadius: 50.0, // soften the shadow
                            spreadRadius: 0.2, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      width: 160,
                      height: 160,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'Deaths\n$death',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

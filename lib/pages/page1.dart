import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../services/cases.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../pages/page5.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text(
                'COVID 19 Tracker',
                style: TextStyle(
                  color: Colors.amber,
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
                leading: Image.asset(
                  'assets/india.png',
                  height: 38,
                ),
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
              leading: Icon(
                Icons.location_on,
                size: 35,
              ),
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
              leading: Image.asset(
                'assets/graph.jpg',
                height: 32,
              ),
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
              leading: Image.asset(
                'assets/cough.png',
                height: 38,
              ),
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
            ListTile(
              leading: Image.asset(
                'assets/mask.png',
                height: 38,
              ),
              title: Text(
                'Prevention',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'ProximaNova',
                  letterSpacing: -0.5,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/Page3');
                Navigator.push(context, ScaleRoute(page: Page5()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        // color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.refresh,
                          // color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => Navigator.push(
                            context, SizeRoute(page: SplashScreen())),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Cases in India',
                    style: TextStyle(
                      fontFamily: 'SFBold',
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 2,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            elevation: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.red[500],
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.red[700],
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Confirmed:',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '$total',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            elevation: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.blue[700],
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.blue[800],
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Active:',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '$active',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            elevation: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Color(0xff0f9d58),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.green[700],
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Recovered:',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '$recovered',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            elevation: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.grey[800],
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Deaths:',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    '$death',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

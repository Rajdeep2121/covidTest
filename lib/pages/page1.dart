import 'package:flutter/material.dart';
import '../services/cases.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String total = 'loading';
  String active = 'loading';
  String death = 'loading';
  String recovered = 'loading';
  void setIndiaCases() async {
    IndiaCases instance = IndiaCases();
    await instance.getCases();
    // print(instance.activeCases);
    // print(instance.totalCases);
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
    setIndiaCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[850],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          elevation: 100,
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          // titleSpacing: 2,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'CASES IN INDIA',
              style: TextStyle(
                fontFamily: 'Lulo',
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
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
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/'); //pop it
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'States',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Page2');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          height: 500,
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
    );
  }
}

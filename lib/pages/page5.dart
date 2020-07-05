import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../services/scaleroute.dart';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
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
            ListTile(
              leading: Image.asset(
                'assets/india.png',
                height: 38,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                  letterSpacing: -0.5,
                ),
              ),
              onTap: () {
                Navigator.push(context, ScaleRoute(page: Page1()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                size: 35,
              ),
              title: Text(
                'States',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                  letterSpacing: -0.5,
                ),
              ),
              onTap: () {
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
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                  letterSpacing: -0.5,
                ),
              ),
              // selected: true,
              onTap: () {
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
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                  letterSpacing: -0.5,
                ),
              ),
              // selected: true,
              onTap: () {
                Navigator.push(context, ScaleRoute(page: Page4()));
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red[100],
              ),
              child: ListTile(
                leading: Image.asset(
                  'assets/mask.png',
                  height: 38,
                ),
                title: Text(
                  'Prevention',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 18,
                    letterSpacing: -0.5,
                  ),
                ),
                selected: true,
                onTap: () {
                  Navigator.push(context, ScaleRoute(page: Page5()));
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                                // color: Colors.white,
                              ),
                              onPressed: () =>
                                  _scaffoldKey.currentState.openDrawer(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Prevention',
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Image.asset(
                        'assets/mask.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
            ),
            height: MediaQuery.of(context).size.height - 170,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Card(
                    color: Colors.lightBlue[200],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Protect yourself and others around you by knowing the facts and taking appropriate precautions. Follow advice provided by your local health authority.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Card(
                    color: Colors.green[200],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'To prevent the spread of COVID-19:\n\n• Clean your hands often. Use soap and water, or an alcohol-based hand rub.\n• Maintain a safe distance from anyone who is coughing or sneezing.\n• Wear a mask when physical distancing is not possible.\n• Don’t touch your eyes, nose or mouth.\n• Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.\n• Stay home if you feel unwell.\n• If you have a fever, cough and difficulty breathing, seek medical attention.',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

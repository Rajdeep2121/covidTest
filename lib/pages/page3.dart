import 'dart:convert';
import '../main.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page4.dart';
import '../pages/page5.dart';
import '../services/scaleroute.dart';
import '../services/sizeroute.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<List<Data>> getCases() async {
    var response = await get('https://api.covid19india.org/states_daily.json');
    var data = jsonDecode(response.body);
    int len = data['states_daily'].length;

    List<Data> cases = [];

    var jconfd = len - 3;
    var jdeath = len - 1;
    var jrecovered = len - 2;
    // var count = 0;
    for (var count = 0; count < 20; count++) {
      Data newuser = Data(
        date: data['states_daily'][jconfd]['date'],
        listTotal: data['states_daily'][jconfd]['tt'],
        listRecd: data['states_daily'][jrecovered]['tt'],
        listDeaths: data['states_daily'][jdeath]['tt'],
      );
      cases.add(newuser);
      // count += 1;
      jconfd -= 3;
      jrecovered -= 3;
      jdeath -= 3;
    }

    // print(cases);
    return cases;
  }

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
            Container(
              decoration: BoxDecoration(
                color: Colors.red[100],
              ),
              child: ListTile(
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
                selected: true,
                onTap: () {
                  Navigator.push(context, ScaleRoute(page: Page3()));
                },
              ),
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
              onTap: () {
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
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                  letterSpacing: -0.5,
                ),
              ),
              onTap: () {
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
                        onPressed: () =>
                            Navigator.push(context, SizeRoute(page: Page3())),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Daily Cases',
                    style: TextStyle(
                      fontFamily: 'SFRounded',
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 2,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: getCases(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff654ea3),
                        Color(0xffeaafc8),
                      ],
                    ),
                    // color: Colors.amber[300],
                  ),
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 200),
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Card(
                          color: Colors.amber[100],
                          // color: Color(0xffFFAF7B),
                          // color: Colors.teal[100],
                          // color: Color(0xffad5389),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      '${snapshot.data[index].date}',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Cases: ${snapshot.data[index].listTotal}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ProximaNova',
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        "Recovered: ${snapshot.data[index].listRecd}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ProximaNova',
                                          color: Colors.teal[500],
                                        ),
                                      ),
                                      Text(
                                        "Deaths: ${snapshot.data[index].listDeaths}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ProximaNova',
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Data {
  String date;
  String listTotal;
  String listRecd;
  String listDeaths;
  Data({this.date, this.listTotal, this.listRecd, this.listDeaths});
}

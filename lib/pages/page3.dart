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
  _showSnackBar() {
    final snackbar = SnackBar(
      content: Text(
        'Refreshed',
        style: TextStyle(
          fontFamily: 'ProximaNova',
          fontSize: 20,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

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
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[900],
        ),
        child: Drawer(
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
                  color: Colors.white,
                  height: 38,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
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
                  color: Colors.white,
                  size: 35,
                ),
                title: Text(
                  'States',
                  style: TextStyle(
                    color: Colors.white,
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
                  color: Colors.green[100],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.show_chart,
                    size: 35,
                    color: Colors.green[800],
                  ),
                  title: Text(
                    'Daily Cases',
                    style: TextStyle(
                      color: Colors.green[800],
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => _showSnackBar(),
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
                      color: Colors.grey[400],
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
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff000000),
                        Color(0xff04619F),
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
                          color: Color(0xff373739),
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
                                        color: Color(0xffffd60a),
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "Cases: ${formatNumber(snapshot.data[index].listTotal)}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ProximaNova',
                                          color: Color(0xffff453a),
                                        ),
                                      ),
                                      Text(
                                        "Recovered: ${formatNumber(snapshot.data[index].listRecd)}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ProximaNova',
                                          color: Color(0xff32d74b),
                                        ),
                                      ),
                                      Text(
                                        "Deaths: ${formatNumber(snapshot.data[index].listDeaths)}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ProximaNova',
                                          // color: Colors.grey[600],
                                          color: Colors.grey[400],
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

  formatNumber(String n) {
    String newnew = '';
    int count = 0;
    if (n.length == 3) {
      return n;
    } else {
      for (var i = n.length - 1; i >= n.length - 3; i--) {
        newnew += n[i];
      }
      newnew += ',';
      for (var j = n.length - 4; j >= 0; j--) {
        newnew += n[j];
        count += 1;
        if (count == 2) {
          count = 0;
          newnew += ',';
        }
      }
      String finalString = newnew.split('').reversed.join('');
      if (finalString[0] == ',') {
        finalString = finalString.substring(1);
      }
      if (finalString[0] == '+') {
        if (finalString[1] == ',') {
          finalString = '+' + finalString.substring(2);
        }
      }
      return (finalString);
    }
  }
}

class Data {
  String date;
  String listTotal;
  String listRecd;
  String listDeaths;
  Data({this.date, this.listTotal, this.listRecd, this.listDeaths});
}

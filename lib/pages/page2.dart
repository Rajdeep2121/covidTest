import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../pages/page5.dart';
import '../services/scaleroute.dart';
import '../services/sizeroute.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<List<Data>> getCases() async {
    var response = await get('https://api.covid19india.org/data.json');
    var data = jsonDecode(response.body);
    // print(data['statewise']);
    // print(data['statewise']);
    List<Data> cases = [];
    for (var u in data['statewise']) {
      // print(u['active']);
      Data user = Data(
        state: u['state'],
        confirmed: u["confirmed"],
        active: u['active'],
        deaths: u['deaths'],
        recovered: u['recovered'],
        delConfd: u['deltaconfirmed'],
        delRecd: u['deltarecovered'],
        delDeath: u['deltadeaths'],
        stateNotes: u['statenotes'],
      );
      cases.add(user);
      if (u['state'] == 'Total' || u['state'] == 'State Unassigned') {
        cases.removeLast();
      }
    }
    // print(cases);
    return cases;
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
            ListTile(
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
              onTap: () {
                Navigator.push(context, ScaleRoute(page: Page1()));
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red[100],
              ),
              child: ListTile(
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
                selected: true,
                onTap: () {
                  // Navigator.pushNamed(context, '/Page2');
                  Navigator.push(context, ScaleRoute(page: Page2()));
                },
              ),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(90),
              ),
              // color: Colors.lightBlue,
            ),
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
                            Navigator.push(context, SizeRoute(page: Page2())),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'States of India',
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    color: Colors.green[100],
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  // height: MediaQuery.of(context).size.height * 5,
                  // padding: EdgeInsets.only(
                  //     top: 25, left: 10, bottom: 3400, right: 10),
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 200),
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.only(top: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        // color: Colors.lightBlue[100],
                        color: Colors.red[100],
                        elevation: 10,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(
                                  "${snapshot.data[index].state}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Confirmed: ${snapshot.data[index].confirmed} (+${snapshot.data[index].delConfd})",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "Active: ${snapshot.data[index].active}",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Colors.lightBlue[900],
                                  ),
                                ),
                                Text(
                                  "Recovered: ${snapshot.data[index].recovered} (+${snapshot.data[index].delRecd})",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Colors.teal[500],
                                  ),
                                ),
                                Text(
                                  "Deaths: ${snapshot.data[index].deaths} (+${snapshot.data[index].delDeath})",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '${snapshot.data[index].stateNotes}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontFamily: 'SFRegular',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // SizedBox(height: 10),
                              ],
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
  final String state;
  final String confirmed;
  final String active;
  final String deaths;
  final String recovered;
  final String delConfd;
  final String delRecd;
  final String delDeath;
  final String stateNotes;
  Data({
    this.state,
    this.confirmed,
    this.active,
    this.deaths,
    this.recovered,
    this.delConfd,
    this.delRecd,
    this.delDeath,
    this.stateNotes,
  });
}

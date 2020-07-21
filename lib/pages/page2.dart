import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../pages/page5.dart';
import '../services/scaleroute.dart';

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
                  color: Colors.green[100],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    size: 35,
                    color: Colors.green[800],
                  ),
                  title: Text(
                    'States',
                    style: TextStyle(
                      color: Colors.green[800],
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
                leading: Icon(
                  Icons.show_chart,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text(
                  'Daily Cases',
                  style: TextStyle(
                    color: Colors.white,
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                    'States of India',
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    // color: Colors.green[100],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff000000),
                          Color(0xffA55C1B),
                          // Color(0xff63D471),
                        ]),
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
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Color(0xff373739),
                        ),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(20.0),
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
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Confirmed: ${formatNumber(snapshot.data[index].confirmed)} (+${snapshot.data[index].delConfd})",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Color(0xfffd415e),
                                  ),
                                ),
                                Text(
                                  "Active: ${formatNumber(snapshot.data[index].active)}",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Color(0xff0a84ff),
                                  ),
                                ),
                                Text(
                                  "Recovered: ${formatNumber(snapshot.data[index].recovered)} (+${snapshot.data[index].delRecd})",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    // color: Colors.teal[500],
                                    color: Color(0xff34c759),
                                  ),
                                ),
                                Text(
                                  "Deaths: ${formatNumber(snapshot.data[index].deaths)} (+${snapshot.data[index].delDeath})",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 16,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '${snapshot.data[index].stateNotes}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontFamily: 'SFRegular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
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

import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page3.dart';
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
          recovered: u['recovered']);
      cases.add(user);
      if (u['state'] == 'Total' || u['state'] == 'State Unassigned') {
        cases.removeLast();
      }
    }
    // print(cases);
    return cases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.amberAccent,
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
          backgroundColor: Colors.grey[850],
          titleSpacing: 2,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'STATES OF INDIA',
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
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: 30,
                  color: Colors.amberAccent,
                ),
                onPressed: () {
                  Navigator.push(context, SizeRoute(page: Page2()));
                },
              ),
            ),
          ],
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
                selected: true,
                onTap: () {
                  // Navigator.pushNamed(context, '/Page2');
                  Navigator.push(context, ScaleRoute(page: Page2()));
                },
              ),
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
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff3b8d99),
              Color(0xffaa4b6b),
            ],
            // colors: [Color(0xff2c3e50), Color(0xffbdc3c7)],
          ),
        ),
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: getCases(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    // color: Colors.lightBlue[100],
                    // color: Colors.teal[200],
                    elevation: 10,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              "${snapshot.data[index].state}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Confirmed: ${snapshot.data[index].confirmed}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Active: ${snapshot.data[index].active}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.lightBlue[900],
                              ),
                            ),
                            Text(
                              "Recovered: ${snapshot.data[index].recovered}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.teal[500],
                              ),
                            ),
                            Text(
                              "Deaths: ${snapshot.data[index].deaths}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
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
  Data({this.state, this.confirmed, this.active, this.deaths, this.recovered});
}

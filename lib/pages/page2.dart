import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

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
      // backgroundColor: Colors.grey[800],
      // backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 2,
        title: Text(
          'States of India',
          style: TextStyle(
            fontFamily: 'Lulo',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
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
      body: Container(
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

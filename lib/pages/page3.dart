import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
      // backgroundColor: Colors.grey[800],
      backgroundColor: Colors.teal[200],
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
              'DAILY CASES',
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
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: ListTile(
                leading: Icon(Icons.new_releases),
                title: Text(
                  'Daily Cases',
                  style: TextStyle(
                    // color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontSize: 20,
                  ),
                ),
                selected: true,
                onTap: () {
                  Navigator.pushNamed(context, '/Page3');
                },
              ),
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
                              '${snapshot.data[index].date}',
                              // "${snapshot.data[index].state}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Cases: ${snapshot.data[index].listTotal}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Recovered: ${snapshot.data[index].listRecd}",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.teal[500],
                              ),
                            ),
                            Text(
                              "Deaths: ${snapshot.data[index].listDeaths}",
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
  String date;
  String listTotal;
  String listRecd;
  String listDeaths;
  Data({this.date, this.listTotal, this.listRecd, this.listDeaths});
}
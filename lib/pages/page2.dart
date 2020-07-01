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
    print(data['statewise']);
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
    }
    // print(cases);
    return cases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
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
      body: Container(
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
                  return ListTile(
                    title: Center(
                        child: Text(
                      snapshot.data[index].state,
                      style: TextStyle(fontSize: 20, fontFamily: 'ProximaNova'),
                    )),
                    subtitle: Center(
                      child: Text(
                        'Confirmed: ${snapshot.data[index].confirmed}, Active: ${snapshot.data[index].active}, \nRecovered: ${snapshot.data[index].recovered}, Deaths: ${snapshot.data[index].deaths}',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    isThreeLine: true,
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

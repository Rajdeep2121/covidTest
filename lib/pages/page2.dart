import 'package:flutter/material.dart';
import '../services/statecases.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var listStates = [];
  var listConfirmed = [];
  var listRecovered = [];
  var listActive = [];
  var listDeath = [];

  void setStateCases(
      listStates, listConfirmed, listRecovered, listActive, listDeath) async {
    StateCases instance = StateCases();
    await instance.getCases();
    print(instance.data['statewise'].length);

    for (var i = 1; i < instance.data['statewise'].length; i++) {
      // print(instance.data['statewise'][i]['state']);
      listStates.add(instance.data['statewise'][i]['state']);
      listConfirmed.add(instance.data['statewise'][i]['confirmed']);
      listRecovered.add(instance.data['statewise'][i]['recovered']);
      listActive.add(instance.data['statewise'][i]['active']);
      listDeath.add(instance.data['statewise'][i]['deaths']);
    }
  }

  @override
  void initState() {
    super.initState();
    setStateCases(
        listStates, listConfirmed, listRecovered, listActive, listDeath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 2,
        title: Text(
          'Page 2',
          style: TextStyle(
            fontFamily: 'ProximaNova',
            color: Colors.white70,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

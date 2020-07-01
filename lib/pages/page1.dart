import 'package:flutter/material.dart';
import '../services/cases.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String total = 'loading';
  String active = 'loading';
  String death = 'loading';
  String recovered = 'loading';
  void setIndiaCases() async {
    IndiaCases instance = IndiaCases();
    await instance.getCases();
    // print(instance.activeCases);
    // print(instance.totalCases);
    setState(() {
      total = instance.totalCases;
      active = instance.activeCases;
      recovered = instance.recoveredCases;
      death = instance.deathCases;
    });
  }

  @override
  void initState() {
    super.initState();
    setIndiaCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 2,
        title: Text(
          'CASES IN INDIA',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 50.0, // soften the shadow
                      spreadRadius: 0.2, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                width: 150,
                height: 100,
                child: Center(
                  child: Text(
                    'Confirmed\n$total',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue[600],
                  ),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.blue[600],
                      blurRadius: 50.0, // soften the shadow
                      spreadRadius: 0.2, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 150,
                height: 100,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Active\n$active',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green[500],
                  ),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.green[500],
                      blurRadius: 50.0, // soften the shadow
                      spreadRadius: 0.2, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  color: Colors.green[500],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 150,
                height: 100,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Recovered\n$recovered',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[800],
                  ),
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: Colors.grey[800],
                      blurRadius: 50.0, // soften the shadow
                      spreadRadius: 0.2, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 150,
                height: 100,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Deaths\n$death',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Page2');
            },
            child: Text('Page2'),
          ),
        ],
      ),
    );
  }
}

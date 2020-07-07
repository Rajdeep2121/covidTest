import 'package:flutter/material.dart';
import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page5.dart';
import '../services/scaleroute.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldkey,
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
                    fontFamily: 'ProximaNova',
                    fontSize: 18,
                    letterSpacing: -0.5,
                  ),
                ),
                // selected: true,
                onTap: () {
                  Navigator.push(context, ScaleRoute(page: Page3()));
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/cough.png',
                    height: 38,
                  ),
                  title: Text(
                    'Symptoms',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontFamily: 'ProximaNova',
                      fontSize: 18,
                      letterSpacing: -0.5,
                    ),
                  ),
                  selected: true,
                  onTap: () {
                    Navigator.push(context, ScaleRoute(page: Page4()));
                  },
                ),
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
                // selected: true,
                onTap: () {
                  Navigator.push(context, ScaleRoute(page: Page5()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30,
                                // color: Colors.grey[600],
                              ),
                              onPressed: () =>
                                  _scaffoldkey.currentState.openDrawer(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Symptoms',
                        style: TextStyle(
                          fontFamily: 'SFRounded',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/cough.png',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            height: MediaQuery.of(context).size.height - 170,
            child: ListView(
              children: <Widget>[
                Card(
                  elevation: 10,
                  // color: Colors.lightBlue[200],
                  color: Color(0xff5856d6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ProximaNova',
                        fontSize: 20,
                        // fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: Card(
                    elevation: 10,
                    // color: Colors.red[100],
                    // color: Color(0xff34c759),
                    color: Color(0xffff3b30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Most common symptoms:\n• fever\n• dry cough\n• tiredness\n• difficulty breathing or shortness of breath\n• chest pain or pressure\n• loss of speech or movement',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 16,
                          color: Colors.white,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Card(
                    elevation: 10,
                    // color: Color(0xff545458),
                    color: Color(0xff1a846b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Less common symptoms:\n• aches and pains\n• sore throat\n• diarrhoea\n• conjunctivitis\n• headache\n• loss of taste or smell\n• a rash on skin, or discolouration of fingers or toes',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: Colors.white,
                          fontSize: 14,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

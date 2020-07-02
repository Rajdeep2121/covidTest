import 'package:flutter/material.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      // home: Home(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen', //SplashScreen
      routes: {
        '/SplashScreen': (context) => SplashScreen(),
        '/': (context) => Page1(),
        '/Page2': (context) => Page2(),
        '/Page3': (context) => Page3(),
      },
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // color: Colors.blue[900],
              color: Colors.grey[850],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // SizedBox(height: 200),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Image.asset('assets/circle-cropped.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      // SizedBox(height: 100),
                      Text(
                        'COVID-19',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Lulo',
                        ),
                      ),
                      Text(
                        'Live Tracker',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Lulo',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.greenAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

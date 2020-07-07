import 'package:flutter/material.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'pages/page4.dart';
import 'pages/page5.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => SplashScreen(),
        '/': (context) => Page1(),
        '/Page2': (context) => Page2(),
        '/Page3': (context) => Page3(),
        '/Page4': (context) => Page4(),
        '/Page5': (context) => Page5()
      },
    ));
  });
}

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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/icon.png',
                height: MediaQuery.of(context).size.height / 10,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            Text(
              'COVID-19',
              style: TextStyle(
                color: Color(0xff111111),
                fontFamily: 'ProximaNova',
                fontSize: MediaQuery.of(context).size.height / 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Live Tracker',
                style: TextStyle(
                  color: Color(0xff111111),
                  fontFamily: 'SFRounded',
                  fontSize: MediaQuery.of(context).size.height / 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            SpinKitRotatingCircle(
              size: MediaQuery.of(context).size.height / 10,
              color: Color(0xfffd415e),
            ),
          ],
        ),
      ),
    );
  }
}

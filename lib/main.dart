import 'package:flutter/material.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';

void main() => runApp(MaterialApp(
      // home: Home(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Page1(),
        '/Page2': (context) => Page2(),
      },
    ));

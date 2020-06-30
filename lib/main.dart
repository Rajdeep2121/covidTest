import 'package:flutter/material.dart';
import 'pages/page1.dart';

void main() => runApp(MaterialApp(
      // home: Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Page1(),
      },
    ));

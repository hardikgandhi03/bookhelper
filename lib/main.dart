import 'package:bookhelper/screens/booklist.dart';
import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/screens/login/login.dart';
import 'package:bookhelper/screens/chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginScreen(),
    );
  }
}

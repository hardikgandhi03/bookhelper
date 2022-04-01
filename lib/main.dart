import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/screens/login/login.dart';
import 'package:bookhelper/screens/chart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() {
//   Firebase.initializeApp();
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginScreen(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: "start",
    //   routes: {
    //     "start": (context) => loginScreen(),
    //     "home": (context) => Home(),
    //   },
    // );
  }
}

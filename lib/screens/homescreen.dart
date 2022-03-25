import 'package:bookhelper/screens/booklist.dart';
import 'package:bookhelper/screens/homepage.dart';
import 'package:bookhelper/screens/profile.dart';
import 'package:bookhelper/screens/chart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bookhelper/screens/friendslist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 2;
  List page_screens = [
    booklist(),
    friendList(),
    HomePage(),
    profileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Book Helper"),
        backgroundColor: Color(0xff2855ae),
        actions: [],
      ),
      body: page_screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        index: _page,
        animationCurve: Curves.easeInOut,
        backgroundColor: Colors.blue.shade200,
        items: <Widget>[
          Icon(
            Icons.add_circle_outline,
            size: 30,
          ),
          Icon(
            Icons.group,
            size: 30,
          ),
          Icon(Icons.home, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
          //Handle button tap
        },
      ),
    );
  }
}

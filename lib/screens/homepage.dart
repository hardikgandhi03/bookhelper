import 'package:bookhelper/screens/booklist.dart';
import 'package:bookhelper/screens/currentlyreading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              //color: Colors.black,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    //color: Colors.white,
                    margin: EdgeInsets.only(
                      // top: 10,
                      //bottom: 15,
                      right: 15,
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Icon(
                      //Icons.add_circle,
                      Icons.add_circle_outline,
                      size: 40.0,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      //color: Colors.white,
                      margin: EdgeInsets.only(
                        // top: 10,
                        //bottom: 15,
                        right: 15,
                      ),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: const Text(
                          "Currently Reading",
                          style: TextStyle(fontSize: 22),
                          //textAlign: ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CurrentlyReading(),
              //   ),
              // );
            },
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              //color: Colors.black,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    //color: Colors.white,
                    margin: EdgeInsets.only(
                      // top: 10,
                      //bottom: 15,
                      right: 15,
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Icon(
                      //Icons.add_circle,
                      Icons.favorite_border_rounded,
                      size: 40.0,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      //color: Colors.white,
                      margin: EdgeInsets.only(
                        // top: 10,
                        //bottom: 15,
                        right: 15,
                      ),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: const Text(
                          "Wishlist",
                          style: TextStyle(fontSize: 22),
                          //textAlign: ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("Container 2 tapped");
            },
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              //color: Colors.black,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    //color: Colors.white,
                    margin: EdgeInsets.only(
                      // top: 10,
                      //bottom: 15,
                      right: 15,
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Icon(
                      //Icons.add_circle,
                      Icons.book_outlined,
                      size: 40.0,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      //color: Colors.white,
                      margin: EdgeInsets.only(
                        // top: 10,
                        //bottom: 15,
                        right: 15,
                      ),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: const Text(
                          "Done Reading",
                          style: TextStyle(fontSize: 22),
                          //textAlign: ,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              print("Container 3 tapped");
            },
          ),
        ],
      ),
    );
  }
}

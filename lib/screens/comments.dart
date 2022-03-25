import 'package:bookhelper/screens/addReview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class comments extends StatefulWidget {
  const comments({Key? key}) : super(key: key);

  @override
  _commentsState createState() => _commentsState();
}

class _commentsState extends State<comments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reviews"),
          backgroundColor: Color(0xff2855ae),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.blue.shade200,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.greenAccent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text("By : "),
                              Text(
                                "Hardik Gandhi",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Personally I have liked this book very much. Even I can say that this book is the book which has changed my life."),
                        RatingBar.builder(
                          initialRating: 4,
                          ignoreGestures: true,
                          minRating: 1,
                          allowHalfRating: false,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.greenAccent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text("By : "),
                              Text(
                                "Raj Dhadhaniya",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Personally I haven't liked this book very much. I would say give it a try!"),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.greenAccent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text("By : "),
                              Text(
                                "Aman Desai",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Well I have enjoyed reading this book. Would surely suggest to give it atleast a read."),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addReview(),
              ),
            );
          },
          child: Icon(
            Icons.add_outlined,
            size: 40,
          ),
        ),
      ),
    );
  }
}

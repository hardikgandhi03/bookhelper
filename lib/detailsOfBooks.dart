import 'package:bookhelper/books.dart';
import 'package:bookhelper/screens/chart.dart';
import 'package:bookhelper/screens/explorebooks.dart';
import 'package:flutter/material.dart';

class bookDetails extends StatelessWidget {
  const bookDetails({Key? key, required this.book}) : super(key: key);
  final Books book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookName.toString()),
        backgroundColor: Color(0xff2855ae),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue[300],
              ),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Text(
                    "Author : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    book.bookAuthorName.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 15,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),

            Container(
              // child: chartDisplay(
              //   book: book,
              // ),
              child: chartDisplay(
                star1: book.star1.toString(),
                star2: book.star2.toString(),
                star3: book.star3.toString(),
                star4: book.star4.toString(),
                star5: book.star5.toString(),
              ),
            ),

            SizedBox(
              height: 25.0,
            ),
            // ElevatedButton(
            //   onPressed: () => {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const comments()),
            //     )
            //   },
            //   child: Container(color: Colors.blue, child: Text("Reviews")),
            // )
          ],
        ),
      ),
    );
  }
}

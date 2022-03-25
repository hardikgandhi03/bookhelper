import 'package:bookhelper/screens/booklist.dart';
import 'package:flutter/material.dart';

class CurrentlyReading extends StatefulWidget {
  const CurrentlyReading({Key? key}) : super(key: key);

  @override
  State<CurrentlyReading> createState() => _CurrentlyReadingState();
}

class _CurrentlyReadingState extends State<CurrentlyReading> {
  final List<Book> Books = List.generate(
    3,
    (i) => Book(
      'Book name $i',
      'Name of bookauthor $i',
    ),
  );

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
      body: Container(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: ListView.builder(
          itemCount: Books.length,
          itemBuilder: (context, index) {
            return BookListTile(
              booktitle: Books[index].booktitle,
              bookauthor: Books[index].bookauthor,
            );
          },
        ),
      ),
    );
  }
}

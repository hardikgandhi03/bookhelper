import 'dart:convert';

import 'package:bookhelper/screens/booklist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DatafromAPI extends StatefulWidget {
  const DatafromAPI({Key? key}) : super(key: key);

  @override
  State<DatafromAPI> createState() => _DatafromAPIState();
}

class _DatafromAPIState extends State<DatafromAPI> {
  Future getBookData() async {
    var response = await http.get(Uri.https('raw.githubusercontent.com',
        'SoroushGhaderi/goodreads_book_dataset/master/dataset/book1-100k.json'));
    var jsonData = jsonDecode(response.body);

    List<Books> books = [];

    for (var b in jsonData) {
      Books book = Books(b['bookName'], b['bookAuthorName']);
      books.add(book);
    }
    print(books.length);
    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Books'),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Click me!'),
        onPressed: () {
          getBookData();
        },
      )),
    );
  }
}

class Books {
  final String bookName, bookAuthorName;

  Books(this.bookName, this.bookAuthorName);
}

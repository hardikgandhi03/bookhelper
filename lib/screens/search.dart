import 'dart:async';

import 'package:bookhelper/books.dart';
import 'package:bookhelper/books_api.dart';
import 'package:bookhelper/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class searchScreen extends StatefulWidget {
  @override
  searchScreenState createState() => searchScreenState();
}

class searchScreenState extends State<searchScreen> {
  List<dynamic> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getBooks(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Search a Book"),
          backgroundColor: Color(0xff2855ae),
        ),
        backgroundColor: Colors.blue.shade200,
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await BooksApi.getBooks(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

  Widget buildBook(Books book) => ListTile(
        title: Text(book.bookName!),
        subtitle: Text(book.bookAuthorName!),
      );
}

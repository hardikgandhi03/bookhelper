import 'dart:convert';

import 'package:bookhelper/books.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List> getBooks(String query) async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/SoroushGhaderi/goodreads_book_dataset/master/dataset/book1-100k.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Books.fromJson(json)).where((book) {
        final titleLower = book.bookName!.toLowerCase();
        final authorLower = book.bookAuthorName!.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

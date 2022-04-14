import 'dart:convert';

import 'package:bookhelper/screens/booklist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class DatafromAPI extends StatefulWidget {
//   const DatafromAPI({Key? key}) : super(key: key);

//   @override
//   State<DatafromAPI> createState() => _DatafromAPIState();
// }

// class _DatafromAPIState extends State<DatafromAPI> {
//   Future<List> getBookData() async {
//     try {
//       print("star");
//       var response = await http.get(
//         Uri.parse(
//             'https://raw.githubusercontent.com/SoroushGhaderi/goodreads_book_dataset/master/dataset/book1-100k.json'),
//         headers: {
//           "Content-Type": "application/json",
//           "Connection": "Keep-Alive",
//           "Keep-Alive": "timeout=5, max=1000"
//         },
//       );

//       var jsonData = jsonDecode(response.body);
//       print(jsonData);
//     } on Exception catch (e) {
//       print(e);
//     }
//     List<Books> books = [];
//     return books;
//     // for (var b in jsonData) {
//     //   Books book = Books(b['bookName'], b['bookAuthorName']);
//     //   books.add(book);
//     // }
//     // print(books.length);
//     // return books;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Explore Books'),
//         ),
//         body: Container(
//           child: Card(
//             child: FutureBuilder(
//               future: getBookData(),
//               builder: (context, snapshot) {
//                 if (snapshot.data == null) {
//                   return Container(
//                     child: Center(
//                       child: Text('Loading...'),
//                     ),
//                   );
//                 }
//                 return Container();
//                 // return ListView.builder(
//                 //    itemCount: 1,
//                 //   // itemBuilder: (context, i) {
//                 //     // return ListTile(
//                 //     //   title: Text(snapshot.data?[i].bookName),
//                 //     //   subtitle: Text(snapshot.data[i].bookAuthorName),
//                 //     // );
//                 //   },
//                 // );
//               },
//             ),
//           ),
//         ));
//   }
// }

// class Books {
//   final String bookName, bookAuthorName;

//   Books(this.bookName, this.bookAuthorName);
// }

class Books {
  int id;
  String bookName;
  String bookAuthorName;
  String publisher;
  int star1;
  int star2;
  int star3;
  int star4;
  int star5;

  Books.fromJson(Map json)
      : id = json['Id'],
        bookName = json['Name'],
        bookAuthorName = json['Authors'],
        publisher = json['Publisher'],
        star1 = json['RatingDist1'],
        star2 = json['RatingDist2'],
        star3 = json['RatingDist3'],
        star4 = json['RatingDist4'],
        star5 = json['RatingDist5'];

  Map toJson() {
    return {
      'id': id,
      'name': bookName,
      'Authors': bookAuthorName,
      'Publisher': publisher,
      'RatingDist1': star1,
      'RatingDist2': star2,
      'RatingDist3': star3,
      'RatingDist4': star4,
      'RatingDist5': star5,
    };
  }
}

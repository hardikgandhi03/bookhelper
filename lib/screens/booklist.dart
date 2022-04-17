// import 'package:bookhelper/screens/chart.dart';
// import 'package:bookhelper/screens/comments.dart';
// import 'package:flutter/material.dart';

// class Book {
//   final String booktitle;
//   final String bookauthor;

//   const Book(this.booktitle, this.bookauthor);
// }

// class booklist extends StatelessWidget {
//   const booklist({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<Book> Books = List.generate(
//       20,
//       (i) => Book(
//         'Book name $i',
//         'Name of bookauthor $i',
//       ),
//     );
//     return Scaffold(
//       backgroundColor: Colors.blue.shade200,
//       body: Container(
//         padding: const EdgeInsets.only(bottom: 14.0),
//         child: ListView.builder(
//           itemCount: Books.length,
//           itemBuilder: (context, index) {
//             return BookListTile(
//               booktitle: Books[index].booktitle,
//               bookauthor: Books[index].bookauthor,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class BookListTile extends StatelessWidget {
//   const BookListTile({
//     Key? key,
//     required this.booktitle,
//     required this.bookauthor,
//   }) : super(key: key);

//   final String booktitle, bookauthor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 1),
//         //borderRadius: BorderRadius.circular(12),
//         color: Colors.blue.shade200,
//       ),
//       child: ListTile(
//         leading: Image.asset('assets/images/bookcover2.jpg'),
//         title: Text(booktitle),
//         subtitle: Text(bookauthor),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   bookDetails(book: Book(booktitle, bookauthor)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // ignore: camel_case_types

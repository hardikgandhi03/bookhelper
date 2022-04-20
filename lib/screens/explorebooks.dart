import 'dart:convert';
import 'package:bookhelper/books.dart';
import 'package:bookhelper/detailsOfBooks.dart';
import 'package:bookhelper/screens/booklist.dart';
import 'package:bookhelper/screens/chart.dart';
import 'package:bookhelper/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DatafromAPI extends StatefulWidget {
  const DatafromAPI({Key? key}) : super(key: key);

  @override
  State<DatafromAPI> createState() => _DatafromAPIState();
}

class _DatafromAPIState extends State<DatafromAPI> {
  Future<List> getBookData() async {
    List<Books> books = [];
    int count = 0;
    try {
      print("start");
      var response = await http.get(
        Uri.parse(
            'https://raw.githubusercontent.com/SoroushGhaderi/goodreads_book_dataset/master/dataset/book1-100k.json'),
        headers: {
          "Content-Type": "application/json",
          // "Connection": "Keep-Alive",
          // "Keep-Alive": "timeout=5, max=1000"
        },
      );

      var jsonData = jsonDecode(response.body);
      print(jsonData);

      for (var b in jsonData) {
        Books book = Books(
          //id: b['Id'],
          bookName: b['Name'],
          bookAuthorName: b['Authors'],
          star1: b['RatingDist1'],
          star2: b['RatingDist2'],
          star3: b['RatingDist3'],
          star4: b['RatingDist4'],
          star5: b['RatingDist5'],
        );
        count++;
        if (count == 100) {
          print('breaking the list at 100 books');
          break;
        } else {
          books.add(book);
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    return books;
    // for (var b in jsonData) {
    //   Books book = Books(b['bookName'], b['bookAuthorName']);
    //   books.add(book);
    // }
    // print(books.length);
    // return books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text("Explore Books"),
          backgroundColor: Color(0xff2855ae),
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => searchScreen())),
                icon: Icon(Icons.search))
          ],
        ),
        backgroundColor: Colors.blue.shade200,
        body: Container(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Card(
            child: FutureBuilder<List<dynamic>>(
              future: getBookData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  //itemCount: 100,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        //borderRadius: BorderRadius.circular(12),
                        color: Colors.blue.shade200,
                      ),
                      child: ListTile(
                        title: Text(snapshot.data?[i].bookName),
                        subtitle: Text(snapshot.data?[i].bookAuthorName),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => bookDetails(
                                book: Books(
                                    //id: snapshot.data?[i].id,
                                    bookName: snapshot.data?[i].bookName,
                                    bookAuthorName:
                                        snapshot.data?[i].bookAuthorName,
                                    star1: snapshot.data?[i].star1,
                                    star2: snapshot.data?[i].star2,
                                    star3: snapshot.data?[i].star3,
                                    star4: snapshot.data?[i].star4,
                                    star5: snapshot.data?[i].star5),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}

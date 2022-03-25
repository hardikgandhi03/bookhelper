import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class addReview extends StatefulWidget {
  const addReview({Key? key}) : super(key: key);

  @override
  State<addReview> createState() => _addReviewState();
}

class _addReviewState extends State<addReview> {
  late TextEditingController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Review"),
        backgroundColor: Color(0xff2855ae),
      ),
      // body: Container(
      //   color: Colors.blue.shade200,
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      //         child: TextField(
      //           controller: _controller,
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             labelText: 'Review',
      //           ),
      //           // keyboardType: TextInputType.multiline,
      //           // maxLines: null,
      //           onSubmitted: (String value) async {
      //             await showDialog<void>(
      //               context: context,
      //               builder: (BuildContext context) {
      //                 return AlertDialog(
      //                   title: const Text('Thanks!'),
      //                   content: Text('You typed "$value".'),
      //                   actions: <Widget>[
      //                     TextButton(
      //                       onPressed: () {
      //                         Navigator.pop(context);
      //                       },
      //                       child: const Text('OK'),
      //                     ),
      //                   ],
      //                 );
      //               },
      //             );
      //           },
      //         ),
      //       ),
      //       RatingBar.builder(
      //         initialRating: 4,
      //         ignoreGestures: true,
      //         minRating: 1,
      //         allowHalfRating: false,
      //         direction: Axis.horizontal,
      //         itemCount: 5,
      //         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //         itemBuilder: (context, _) => Icon(
      //           Icons.star,
      //           color: Colors.amber,
      //         ),
      //         onRatingUpdate: (rating) {
      //           print(rating);
      //         },
      //       ),
      //     ],
      //   ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.blue.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your review',
                      labelText: 'Review'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Center(
                child: RatingBar.builder(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

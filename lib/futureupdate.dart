import 'package:flutter/material.dart';

class FutureUpdate extends StatelessWidget {
  const FutureUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          elevation: 0,
          title: Text("Future Update"),
          backgroundColor: Color(0xff2855ae),
          actions: [],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Text(
            "This will be added in next update of the App!",
            style: TextStyle(fontSize: 30),
          )),
        ));
  }
}

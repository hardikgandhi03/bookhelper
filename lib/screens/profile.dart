import 'package:bookhelper/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => loginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Profile"),
          backgroundColor: Color(0xff2855ae),
          actions: [],
        ),
        body: Container(
          color: Colors.blue.shade200,
          child: Column(
            children: [
              // Container(
              //   //  color: Colors.black,
              //   child: ListTile(
              //     trailing: Icon(
              //       Icons.edit,
              //       size: 30.0,
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Center(
                    child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage('assets/images/profileimg.jpeg'),
                  ),
                )),
              ),
              Container(
                //color: Colors.black,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        //borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      padding: EdgeInsets.all(40.0),
                      child: Row(
                        children: [
                          Text(
                            "Email : ",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            user.email!,
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: _signOut, child: Text("SignOut")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
    return loginScreen();
  }
}

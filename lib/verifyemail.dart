import 'dart:async';

import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailverified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //user needs to be created before!
    isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailverified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailverified) {
      timer?.cancel();
      FirebaseAuth.instance.signOut();

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginScreen()),
      );
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } on Exception catch (e) {
      // TODO
      final snack = SnackBar(
        content: Text("Error: " + '$e'),
        behavior: SnackBarBehavior.floating,
        elevation: 8,
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailverified
      ? Home()
      : Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            elevation: 0,
            title: Text("Verify Email"),
            backgroundColor: Color(0xff2855ae),
            actions: [],
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A verification email has been sent to your email address!',
                ),
                SizedBox(
                  height: 20,
                ),
                // ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: Size.fromHeight(50),
                //   ),
                //   onPressed: canResendEmail ? sendVerificationEmail() : null,
                //   label: Text('Resend Email'),
                //   icon: Icon(
                //     Icons.email,
                //   ),
                // ),
              ],
            ),
          ),
        );
}

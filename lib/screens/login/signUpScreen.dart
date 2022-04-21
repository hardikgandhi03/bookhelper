import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/verifyemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String email = '';
String pass = '';
String cpass = '';

class SignUpScreen extends StatelessWidget {
  // SignUpScreen({Key? key}) : super(key: key);

  FirebaseAuth authc = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _register() async {
      print(emailController.text +
          "\n" +
          passwordController.text +
          "\n" +
          confirmpasswordController.text);
      try {
        if (passwordController.text != confirmpasswordController.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Password not mached.")));
        } else {
          var user = await authc.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Home()),
          // );
          print(user);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyEmailPage(),
            ),
          );
          //return VerifyEmailPage();
        }
      } catch (e) {
        final snack = SnackBar(
          content: Text("Error: " + '$e'),
          behavior: SnackBarBehavior.floating,
          elevation: 8,
        );
        ScaffoldMessenger.of(context).showSnackBar(snack);

        print(e);
      }
    }

    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue.shade200,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  //color: Colors.lightBlueAccent,
                  width: 300,
                  child: Image.asset('assets/images/book1.jpg',
                      height: MediaQuery.of(context).size.height / 2.7),
                ),
                //Details(),
                TextFormField(
                  autofocus: false,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _register,
                  child: Text(
                    "Register",
                    //style: GoogleFonts.nunito(fontSize: 25)
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 60), primary: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user? ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

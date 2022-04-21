import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/screens/login/signUpScreen.dart';
import 'package:bookhelper/verifyemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// String email = '';
// String pass = '';

class loginScreen extends StatelessWidget {
  //const SignUp({Key? key}) : super(key: key);
  FirebaseAuth authc = FirebaseAuth.instance;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    _register() async {
      print(email + pass);

      try {
        var usr = await authc.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        print("hello");
        print(usr);
        print("hello");

        if (usr != null) {
          if (!usr.user!.emailVerified) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyEmailPage(),
              ),
            );
          }
          //Navigator.pushNamed(context, "login");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
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
                  height: 60,
                ),
                Container(
                  //color: Colors.lightBlueAccent,
                  width: 300,
                  child: Image.asset('assets/images/book_title.jpg',
                      height: MediaQuery.of(context).size.height / 2.7),
                ),
                // Details(),
                SizedBox(height: 10),
                // TextField(
                //   obscureText: false,
                //   keyboardType: TextInputType.emailAddress,
                //   onChanged: (evalue) {
                //     email = evalue;
                //   },
                //   decoration: InputDecoration(
                //       isDense: true,
                //       prefixIcon: Padding(
                //         padding: const EdgeInsets.only(right: 11.0, left: 20),
                //         child: Icon(Icons.email_outlined),
                //       ),
                //       hintText: "Email",
                //       //hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 21),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(50))),
                // ),
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
                  // onChanged: (pvalue) {
                  //   pass = pvalue;
                  // },
                  // decoration: InputDecoration(
                  //     isDense: true,
                  //     prefixIcon: Padding(
                  //       padding: const EdgeInsets.only(right: 11.0, left: 20),
                  //       child: Icon(Icons.password),
                  //     ),
                  //     hintText: "Password",
                  //     //hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 21),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(50)),
                  //         ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _register,
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(300, 60), primary: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a user ? ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        'SIGN UP',
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

class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          // TextField(
          //   obscureText: false,
          //   keyboardType: TextInputType.emailAddress,
          //   onChanged: (evalue) {
          //     email = evalue;
          //   },
          //   decoration: InputDecoration(
          //       isDense: true,
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.only(right: 11.0, left: 20),
          //         child: Icon(Icons.email_outlined),
          //       ),
          //       hintText: "Email",
          //       //hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 21),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(50))),
          // ),
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
              )),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            controller: passwordController,
            // onChanged: (pvalue) {
            //   pass = pvalue;
            // },
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 11.0, left: 20),
                  child: Icon(Icons.password),
                ),
                hintText: "Password",
                //hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 21),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

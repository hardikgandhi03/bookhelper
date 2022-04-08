// import 'package:bookhelper/screens/homescreen.dart';
// import 'package:bookhelper/screens/loginScreen/signUpScreen.dart';
// import 'package:bookhelper/widgets/TextInput.dart' as t;
// import 'package:flutter/material.dart';

// class loginScreenScreen extends StatefulWidget {
//   const loginScreenScreen({Key? key}) : super(key: key);

//   @override
//   State<loginScreenScreen> createState() => _loginScreenScreenState();
// }

// class _loginScreenScreenState extends State<loginScreenScreen> {
//   bool _isObscure = true;
//   var _emailFormKey = GlobalKey<FormState>();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Book Helper"),
//         backgroundColor: Color(0xff2855ae),
//         actions: [],
//       ),
//       body: Container(
//         color: Colors.blue.shade200,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//           ),
//           //height: MediaQuery.of(context).size.height,
//           margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               t.TextInput(
//                   hintText: 'abc@gmail.com',
//                   labelText: "Email",
//                   textInputType: TextInputType.emailAddress,
//                   validatorFunction: () {},
//                   textEditingController: _emailController,
//                   isPassword: false),
//               t.TextInput(
//                 hintText: 'Password',
//                 labelText: 'Password',
//                 suffix: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _isObscure = !_isObscure;
//                     });
//                   },
//                   child: Icon(
//                     Icons.remove_red_eye_rounded,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 textInputType: TextInputType.text,
//                 validatorFunction: () {},
//                 isPassword: _isObscure,
//                 textEditingController: _passwordController,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Home()),
//                   );
//                 },
//                 child: Text("loginScreen"),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'New User For Application? ',
//                     //style: TextStyle(fontSize: 18.0),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignUpScreen()),
//                       );
//                     },
//                     child: Text(
//                       'SIGN UP',
//                       style: TextStyle(fontSize: 18.0, color: Colors.blue),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/screens/login/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String email = '';
String pass = '';

class loginScreen extends StatelessWidget {
  //const SignUp({Key? key}) : super(key: key);
  FirebaseAuth authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _register() async {
      print(email + pass);
      try {
        var usr = await authc.signInWithEmailAndPassword(
            email: email, password: pass);
        print("hello");
        print(usr);
        print("hello");

        if (usr != null) {
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
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login here!",
                  style: TextStyle(fontSize: 22),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  //color: Colors.lightBlueAccent,
                  width: 300,
                  child: Image.asset('assets/images/book1.jpg',
                      height: MediaQuery.of(context).size.height / 2.7),
                ),
                Details(),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          TextField(
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            onChanged: (evalue) {
              email = evalue;
            },
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 11.0, left: 20),
                  child: Icon(Icons.email_outlined),
                ),
                hintText: "Email",
                //hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 21),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          // TextFormField(
          //     autofocus: false,
          //     controller: emailController,
          //     keyboardType: TextInputType.emailAddress,
          //     validator: (value) {
          //       if (value!.isEmpty) {
          //         return ("Please Enter Your Email");
          //       }
          //       // reg expression for email validation
          //       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
          //           .hasMatch(value)) {
          //         return ("Please Enter a valid email");
          //       }
          //       return null;
          //     },
          //     onSaved: (value) {
          //       emailController.text = value!;
          //     },
          //     textInputAction: TextInputAction.next,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(Icons.mail),
          //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          //       hintText: "Email",
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     )),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (pvalue) {
              pass = pvalue;
            },
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

class Option extends StatelessWidget {
  //const Option({ Key? key }) : super(key: key);
  Option({required this.icon});
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: icon,
      ),
    );
  }
}

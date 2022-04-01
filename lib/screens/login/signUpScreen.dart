// import 'package:bookhelper/widgets/TextInput.dart';
// import 'package:flutter/material.dart';

// class signUpScreenScreen extends StatefulWidget {
//   const signUpScreenScreen(BuildContext context, {Key? key}) : super(key: key);

//   @override
//   State<signUpScreenScreen> createState() => _signUpScreenScreenState();
// }

// class _signUpScreenScreenState extends State<signUpScreenScreen> {
//   var _signUPScreenFormKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   bool _isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Book Helper"),
//         backgroundColor: Color(0xff2855ae),
//         actions: [],
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.blue.shade200,
//           //height: 800,
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             //height: MediaQuery.of(context).size.height,
//             //height: 250,
//             margin: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Form(
//                         key: _signUPScreenFormKey,
//                         child: Column(children: [
//                           TextInput(
//                             hintText: 'Hardik M. Gandhi',
//                             labelText: 'Full Name',
//                             textInputType: TextInputType.name,
//                             validatorFunction: (String str) {
//                               if (str.isEmpty)
//                                 return 'This field can not be empty.';
//                               else
//                                 return null;
//                             },
//                             textEditingController: _nameController,
//                             isPassword: false,
//                           ),
//                           TextInput(
//                             hintText: 'hardikgandhi@mail.com',
//                             labelText: 'Email',
//                             textInputType: TextInputType.emailAddress,
//                             validatorFunction: () {},
//                             textEditingController: _emailController,
//                             isPassword: false,
//                           ),
//                           TextInput(
//                             hintText: 'hardikgandhi03',
//                             labelText: 'Username',
//                             textInputType: TextInputType.text,
//                             validatorFunction: () {},
//                             textEditingController: _emailController,
//                             isPassword: false,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {},
//                             child: Text("Create Account"),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Already a user? ',
//                                 style: TextStyle(fontSize: 18.0),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text(
//                                   'SIGN IN',
//                                   style: TextStyle(
//                                       fontSize: 18.0, color: Colors.blue),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ]),
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';

String email = '';
String pass = '';
String cpass = '';

class SignUpScreen extends StatelessWidget {
  //const SignUpScreen({Key? key}) : super(key: key);

  //FirebaseAuth authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _register() async {
      print(email + "\n" + cpass + "\n" + pass);
      try {
        if (pass != cpass) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Password not mached.")));
        } else {
          // var user = await authc.createUserWithEmailAndPassword(
          //   email: email,
          //   password: pass,
          //);
          // print(user);

          if (false) {
            Navigator.pushNamed(context, "home");
          }
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
                  "Register here!",
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Option(icon: Icon(Icons.link, size: 55)),
                //       Option(icon: Icon(Icons.mail_outline, size: 55)),
                //       Option(icon: Icon(Icons.facebook_sharp, size: 55)),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

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
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (pval) {
              pass = pval;
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
          TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (cpval) {
              cpass = cpval;
            },
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 11.0, left: 20),
                  child: Icon(Icons.password),
                ),
                hintText: "Confirm Password",
                //  hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 21),
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

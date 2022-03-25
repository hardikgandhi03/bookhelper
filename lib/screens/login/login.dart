import 'package:bookhelper/screens/homescreen.dart';
import 'package:bookhelper/screens/login/signUpScreen.dart';
import 'package:bookhelper/widgets/TextInput.dart' as t;
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _isObscure = true;
  var _emailFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Book Helper"),
        backgroundColor: Color(0xff2855ae),
        actions: [],
      ),
      body: Container(
        color: Colors.blue.shade200,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          //height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              t.TextInput(
                  hintText: 'abc@gmail.com',
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress,
                  validatorFunction: () {},
                  textEditingController: _emailController,
                  isPassword: false),
              t.TextInput(
                hintText: 'Password',
                labelText: 'Password',
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    color: Colors.grey,
                  ),
                ),
                textInputType: TextInputType.text,
                validatorFunction: () {},
                isPassword: _isObscure,
                textEditingController: _passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text("Login"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New User For Application? ',
                    //style: TextStyle(fontSize: 18.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signUpScreen(context)),
                      );
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

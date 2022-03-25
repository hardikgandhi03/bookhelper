import 'package:bookhelper/widgets/TextInput.dart';
import 'package:flutter/material.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  var _signUPFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Book Helper"),
        backgroundColor: Color(0xff2855ae),
        actions: [],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue.shade200,
          //height: 800,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            //height: MediaQuery.of(context).size.height,
            //height: 250,
            margin: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _signUPFormKey,
                        child: Column(children: [
                          TextInput(
                            hintText: 'Hardik M. Gandhi',
                            labelText: 'Full Name',
                            textInputType: TextInputType.name,
                            validatorFunction: (String str) {
                              if (str.isEmpty)
                                return 'This field can not be empty.';
                              else
                                return null;
                            },
                            textEditingController: _nameController,
                            isPassword: false,
                          ),
                          TextInput(
                            hintText: 'hardikgandhi@mail.com',
                            labelText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            validatorFunction: () {},
                            textEditingController: _emailController,
                            isPassword: false,
                          ),
                          TextInput(
                            hintText: 'hardikgandhi03',
                            labelText: 'Username',
                            textInputType: TextInputType.text,
                            validatorFunction: () {},
                            textEditingController: _emailController,
                            isPassword: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Create Account"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

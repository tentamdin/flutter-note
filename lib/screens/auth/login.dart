import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/screens/auth/signup.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Note',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: authController.email,
                      validator: (value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Email"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: authController.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a password!';
                        } else if (value.length < 6) {
                          return "Please provide password of 5+ character ";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.security,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Password"),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text("Log In"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    authController.login();
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Get.to(SignUp());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

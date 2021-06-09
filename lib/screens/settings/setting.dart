import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  authController.singout();
                },
                leading: Icon(
                  Icons.person,
                ),
                title: Text("Sign out"),
              ),
              ListTile(
                leading: Icon(
                  Icons.star_outline,
                ),
                title: Text("Theme"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

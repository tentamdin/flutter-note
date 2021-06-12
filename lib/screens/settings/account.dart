import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconBtn(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hi, Tamdin!\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      WidgetSpan(
                          child: Icon(
                            Icons.phone,
                            size: 14,
                          ),
                          alignment: PlaceholderAlignment.middle),
                      TextSpan(
                        text: "  +91 56745443433\n",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      WidgetSpan(
                          child: Icon(
                            Icons.email,
                            size: 14,
                          ),
                          alignment: PlaceholderAlignment.middle),
                      TextSpan(
                        text: "   tamdin@gmail.com\n",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                onTap: () {
                  authController.signout();
                },
                title: Text("Logout"),
                leading: Icon(
                  Icons.power_settings_new_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

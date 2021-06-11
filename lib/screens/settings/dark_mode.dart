import 'package:flutter/material.dart';
import 'package:flutter_note/screens/settings/widgets/list_tile.dart';
import 'package:get/get.dart';

class DarkMode extends StatelessWidget {
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
              ListTileSetting(
                  onTap: () {},
                  title: "Use device setting",
                  iconData: Icons.settings_brightness_outlined,
                  subtitle: Text(
                    "Auttomatically swtich between Light and Dark themes when your system does",
                  )),
              ListTileSetting(
                onTap: () {},
                title: "Light Mode",
                iconData: Icons.brightness_5,
                subtitle: null,
              ),
              ListTileSetting(
                iconData: Icons.brightness_4_outlined,
                onTap: () {},
                title: "Dark Mode",
                subtitle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

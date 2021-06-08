import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';

class AddNotePage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            12.0,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade800,
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.delete,
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          autofocus: true,
                          controller: titleController,
                          decoration: InputDecoration.collapsed(
                            hintText: "Title",
                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (_val) {
                            // title = _val;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Type something...",
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          onChanged: (_val) {
                            // des = _val;
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text != "" || bodyController.text != "") {
            Database().addNote(authController.user.uid, titleController.text,
                bodyController.text);
            Get.back();
            titleController.clear();
            bodyController.clear();
          }
        },
        label: Text("Save"),
        icon: Icon(Icons.save),
      ),
    );
  }
}

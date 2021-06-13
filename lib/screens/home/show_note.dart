import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/screens/widgets/custom_icon_btn.dart';
import 'package:flutter_note/services/database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ShowNote extends StatelessWidget {
  final NoteModel noteData;
  final int index;
  ShowNote({this.noteData, this.index});
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title = noteController.notes[index].title;
    String body = noteController.notes[index].body;
    titleController.text = noteController.notes[index].title;
    bodyController.text = noteController.notes[index].body;
    var formattedDate = DateFormat.yMMMd()
        .format(noteController.notes[index].creationDate.toDate());
    var time = DateFormat.jm()
        .format(noteController.notes[index].creationDate.toDate());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconBtn(
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                    ),
                  ),
                  CustomIconBtn(
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {
                      showDeleteDialog(context, noteData);
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("$formattedDate at $time"),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // controller: titleController,
                        initialValue: noteController.notes[index].title,
                        maxLines: null,
                        decoration: InputDecoration.collapsed(
                          hintText: "Title",
                        ),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: (_val) {
                          title = _val;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autofocus: true,
                        initialValue: noteController.notes[index].body,
                        // controller: bodyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration.collapsed(
                          hintText: "Type something...",
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        onChanged: (_val) {
                          body = _val;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() => title ==
                  noteController.notes[index].title &&
              body == noteController.notes[index].body
          ? FloatingActionButton.extended(
              onPressed: () {
                if (titleController.text != "" || bodyController.text != "") {
                  Database().updateNote(
                      authController.user.uid, title, body, noteData.id);
                  Get.back();
                  titleController.clear();
                  bodyController.clear();
                }
              },
              label: Text("Save"),
              icon: Icon(Icons.save),
            )
          : Container()),
    );
  }
}

void showDeleteDialog(BuildContext context, noteData) {
  final AuthController authController = Get.find<AuthController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "Delete Note?",
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text("Are you sure you want to delete this note?",
            style: Theme.of(context).textTheme.subtitle1),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Yes",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Get.back();
              Database().delete(authController.user.uid, noteData.id);
              Get.back(closeOverlays: true);
            },
          ),
          TextButton(
            child: Text(
              "No",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

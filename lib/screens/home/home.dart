import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/show_note.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class HomePage extends GetWidget<AuthController> {
  final UserController userController = Get.find<UserController>();
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();

  final lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100,
    Colors.purpleAccent,
    Colors.greenAccent.shade400,
    Colors.cyanAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        onPressed: () {
                          controller.singout();
                        },
                        icon: Icon(
                          Icons.settings,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GetX<NoteController>(
                    init: noteController,
                    builder: (noteController) {
                      if (noteController != null &&
                          noteController.notes != null) {
                        return Expanded(
                          child: StaggeredGridView.countBuilder(
                            // padding: EdgeInsets.all(8),
                            itemCount: noteController.notes.length,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(2),
                            crossAxisCount: 4,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemBuilder: (context, index) {
                              var formattedDate = DateFormat.yMMMd().format(
                                  noteController.notes[index].creationDate
                                      .toDate());
                              Random random = new Random();
                              Color bg = lightColors[random.nextInt(8)];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => ShowNote(
                                      noteData: noteController.notes[index]));
                                },
                                child: Card(
                                  color: bg,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          noteController.notes[index].title,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                          noteController.notes[index].body,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(
                                          color: Colors.grey.shade900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          // ListView.builder(
                          //     itemCount: noteController.notes.length,
                          //     itemBuilder: (context, index) {
                          //       var formattedDate = DateFormat.yMMMd().format(
                          //           noteController.notes[index].creationDate
                          //               .toDate());
                          //       print("Timestamp  ::$formattedDate");
                          //       return Card(
                          //         color: Colors.teal,
                          //         child: Column(
                          //           children: [
                          //             ListTile(
                          //               title: Text(
                          //                 noteController.notes[index].title,
                          //                 style: TextStyle(
                          //                   color: Colors.black,
                          //                   fontSize: 18,
                          //                   fontWeight: FontWeight.w500,
                          //                 ),
                          //               ),
                          //               subtitle: Text(
                          //                 noteController.notes[index].body,
                          //                 style: TextStyle(
                          //                   fontSize: 14,
                          //                   color: Colors.black,
                          //                 ),
                          //               ),
                          //             ),
                          //             Text(
                          //               DateFormat.yMMMd().format(noteController
                          //                   .notes[index].creationDate
                          //                   .toDate()),
                          //               style: TextStyle(
                          //                 color: Colors.grey.shade900,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     }),
                        );
                      } else {
                        return Text("Loading...");
                      }
                    }),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: () {
            Get.to(() => AddNotePage());
          },
          child: Icon(
            Icons.note_add,
            size: 30,
          )),
    );
  }
}

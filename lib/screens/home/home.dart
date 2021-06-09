import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/show_note.dart';
import 'package:flutter_note/screens/settings/setting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class HomePage extends GetWidget<AuthController> {
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
    int axisCount = 2;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            axisCount == 2 ? Icons.list : Icons.grid_on,
                          ),
                        ),
                      ),
                      Text(
                        "Notes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => Setting());
                          },
                          icon: Icon(
                            Icons.settings,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetX<NoteController>(
                    init: Get.put<NoteController>(NoteController()),
                    builder: (NoteController noteController) {
                      if (noteController != null &&
                          noteController.notes != null) {
                        return Expanded(
                          child: StaggeredGridView.countBuilder(
                            physics: BouncingScrollPhysics(),
                            itemCount: noteController.notes.length,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(axisCount),
                            crossAxisCount: 4,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            itemBuilder: (context, index) {
                              var formattedDate = DateFormat.yMMMd().format(
                                  noteController.notes[index].creationDate
                                      .toDate());
                              Random random = new Random();
                              Color bg = lightColors[random.nextInt(8)];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => ShowNote(
                                      index: index,
                                      noteData: noteController.notes[index]));
                                },
                                child: Container(
                                  padding:
                                      // EdgeInsets.all(8),
                                      EdgeInsets.only(
                                    bottom: 10,
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: bg,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.all(8),
                                        title: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            noteController.notes[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        subtitle: Text(
                                          noteController.notes[index].body,
                                          maxLines: 10,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            formattedDate,
                                            style: TextStyle(
                                              color: Colors.grey.shade900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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

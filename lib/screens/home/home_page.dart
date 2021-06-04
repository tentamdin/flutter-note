import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text("Notes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Center(child: Text("All your notes")),
        ),
      ),
    );
  }
}

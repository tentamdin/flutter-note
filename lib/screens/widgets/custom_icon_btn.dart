import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomIconBtn extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final Widget icon;
  CustomIconBtn({this.color, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    print("Brightness $brightness");
    return Container(
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

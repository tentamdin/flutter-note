import 'package:flutter/material.dart';

class ListTileSetting extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData iconData;
  final Widget subtitle;

  ListTileSetting({this.title, this.iconData, this.onTap, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0,
          ),
          onTap: onTap,
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(
            Icons.arrow_forward_ios,
          ),
          subtitle: subtitle,
        ),
        Divider(
          indent: 60,
          thickness: 2,
        ),
      ],
    );
  }
}

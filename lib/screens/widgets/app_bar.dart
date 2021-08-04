import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
/// NEED TO HAVE THE APP BAR NAVIGATE TO THE RIGHT SCREENS
///
///
class TopAppBar {

  Widget menuIcons = Container(
    child: Row(
      children: [
        Padding(
            padding:
            EdgeInsets.fromLTRB(sidePadding, 0, betweenContainers, 5),
            child: Icon(Icons.send, color: Colors.grey, size: 25)),
        Padding(
            padding: EdgeInsets.fromLTRB(
                betweenContainers, 0, betweenContainers, 5),
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.grey,
              size: 25,
            )),
        Padding(
            padding:
            EdgeInsets.fromLTRB(betweenContainers, 0, sidePadding, 5),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.grey,
              size: 25,
            ))
      ],
    ),
  );

  AppBar getAppBar(titleText) {
    return AppBar(
      title: Text(titleText,
          style: TextStyle(color: primaryTextColor, fontSize: 23)),
      actions: [menuIcons],
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      titleSpacing: 30,
      shadowColor: Colors.white, // can turn shadow on or off
    );
  }
}
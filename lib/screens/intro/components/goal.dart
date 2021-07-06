import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class Goal {

  static Padding init() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Container(
              width: 200.0,
              height: 25.0,
              decoration:
                BoxDecoration(
                    color: treeGreenEventColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
              child: Text("Goal Text")
              )
          ],
        ),
      ),
    );
  }

}
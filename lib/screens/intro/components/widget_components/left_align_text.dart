

import 'package:flutter/cupertino.dart';

class LeftAlignText {

  static Padding align(Widget w) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: w,
      ),
    );
  }
}
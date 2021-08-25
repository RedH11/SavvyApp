

import 'package:flutter/cupertino.dart';

class LeftAlignText {

  static Padding align(Widget w, sidePadding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: sidePadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: w,
      ),
    );
  }
}
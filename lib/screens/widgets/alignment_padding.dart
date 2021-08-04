import 'package:flutter/material.dart';

class AlignmentPadding {

  static Align forWidget(Widget w, Alignment _alignment, EdgeInsets _padding){
    return Align(
      alignment: _alignment,
      child: Padding(
        padding: _padding,
        child: w
      ),
    );
  }
}
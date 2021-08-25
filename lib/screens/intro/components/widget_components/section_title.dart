import 'package:flutter/material.dart';

class SectionTitle {

  static Padding init(var title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child:
        Align(
          alignment: Alignment.topLeft,
          child: title
        ),
    );
  }

}
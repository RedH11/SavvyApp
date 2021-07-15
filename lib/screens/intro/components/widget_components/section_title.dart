import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

class SectionTitle {

  static Padding init(var title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child:
        Align(
          alignment: Alignment.topLeft,
          child: title
        ),
    );
  }

}
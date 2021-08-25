import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class WhiteContainer {

  static Padding init(var topSpacing, List<Widget> containerChildren) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sidePadding, topSpacing, sidePadding, 5),
      child: Container(
        width: double.infinity,
        decoration:
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
          ),
        child: Column(
          children: containerChildren
      )
     )
    );
  }
}
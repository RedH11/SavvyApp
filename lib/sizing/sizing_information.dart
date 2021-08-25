import 'package:flutter/material.dart';

class SizingInformation {
  final Orientation orientation;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.orientation,
    required this.screenSize,
    required this.localWidgetSize
  });
  
  @override
  String toString() {
    return 'Orientation:$orientation ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class InvestingEvent {
  ///
  /// ADD THE INFO NEEDED FOR THE HOME DISPLAY
  ///
  String eventID = "";

  String title = "";
  String abbrv = "";
  String number = "";
  String aim = "";
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  List<String> participants = [];
  int coinCount = 0;
  // +0.00%
  String changePercentage = "";

  String getAbbrv(title) {
    return EVENT_ABBREVIATIONS[title] ?? "ERROR";
  }

  InvestingEvent(title, number, aim, startTime, endTime) {
    this.title = title;
    this.abbrv = getAbbrv(title);
    this.number = number;
    this.aim = aim;
    this.startTime = startTime;
    this.endTime = endTime;
  }
}
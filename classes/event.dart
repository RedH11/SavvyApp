import 'package:flutter/material.dart';

class Event {
  String eventID = "";
  String title = "";
  String description = "";
  String image = "";
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  List<String> participants = [];
  int coinCount = 0;

}

/*
Also we need to keep a count of the # of events

NEED TO WRITE THE ACTUAL DESCRIPTIONS
!!!
And deicde on the actual event types
 */


Map eventDescriptions = {
  "Blitz" : "Descr",
  "Art" : "Descr",
  "Real-Estate" : "Descr",
  "Mainstream" : "Descr"
};

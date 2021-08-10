import 'dart:io';

import 'package:cryptoapp/models/event.dart';
import 'package:cryptoapp/screens/widgets/home_display.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

class AllEvents extends StatefulWidget {
  var allEvents, utcOffset;
  AllEvents(this.allEvents, this.utcOffset);

  @override
  _AllEventsState createState() => _AllEventsState(allEvents, utcOffset);
}

// All events bubble
// Going to connect to bloc that containts the events model class
class _AllEventsState extends State<AllEvents> {

  var allEvents, utcOffset;
  _AllEventsState(this.allEvents, this.utcOffset);

  @override
  Widget build(BuildContext context) {

    var homeDisplay = HomeDisplay();
    var allEventsDisplay = homeDisplay.getAllEventsDisplay(allEvents, utcOffset);

    Widget allEventsBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Text("🥇All Events"),
                    allEventsDisplay
                  ],
                )

            )
    );

    return Padding(
        padding: EdgeInsets.fromLTRB(sidePadding, 15, sidePadding, 5),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(containerRoundness))),
            child: Column(children: <Widget>[allEventsBody])));
  }
}

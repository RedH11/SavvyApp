import 'package:cryptoapp/models/event.dart';
import 'package:cryptoapp/screens/widgets/home_display.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

class YourEvents extends StatefulWidget {

  var userEvents, utcOffset;
  YourEvents(this.userEvents, this.utcOffset);

  @override
  _YourEventsState createState() => _YourEventsState(userEvents, utcOffset);
}

// Your events bubble
// Going to connect to bloc that containts the events model class
class _YourEventsState extends State<YourEvents> {

  var userEvents, utcOffset;
  _YourEventsState(this.userEvents, this.utcOffset);

  @override
  Widget build(BuildContext context) {

    var yourEventsDisplay;

    // If there are no user events
    if (userEvents == []) {
      yourEventsDisplay = Container(
        width: 0,
        height: 0,
      );
    } else {
      var homeDisplay = HomeDisplay();
      yourEventsDisplay = homeDisplay.getUserEventsDisplay(userEvents, utcOffset);
    }

    Widget yourEventsBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Text("🚀Your Events"),
                    //yourEventsDisplay
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
            child: Column(children: <Widget>[yourEventsBody])));
  }
}

import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

class YourEvents extends StatefulWidget {
  //const YourEvents({Key? key}) : super(key: key);

  @override
  _YourEventsState createState() => _YourEventsState();
}

// Your events bubble
// Going to connect to bloc that containts the events model class
class _YourEventsState extends State<YourEvents> {
  @override
  Widget build(BuildContext context) {
    Widget yourEventsBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
            Align(alignment: Alignment.topLeft, child: Text("🚀Your Events")));

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

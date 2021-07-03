import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

class AllEvents extends StatefulWidget {
  //const AllEvents({Key? key}) : super(key: key);

  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  Widget build(BuildContext context) {
    Widget allEventsBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
            Align(alignment: Alignment.topLeft, child: Text("🥇All Events")));
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



import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EventLoadingScreen extends StatelessWidget {

  // Get the EventID passed in
  String eventID;
  EventLoadingScreen(this.eventID);

  @override
  Widget build(BuildContext context) {

    ///
    /// GET FIREBASE LOADING AND DETERMINE WHERE TO SEND THE USER WITH THIS INFO
    ///
    // Import the event data
    var eventID = "123456";
    var eventName = "Default event";
    var eventNumber = "1";
    var eventAim = "default event aim";
    var eventAbbrv = "DFLT";

    var thereIsARecord = false;
    var eventRecordNum = "00.00";
    var eventRecordNumber = "1";

    var eventLockdownTime = "0 days";
    var earningsReceivedDate = "00/00/0000";

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              SpinKitThreeBounce(
                color: BUTTON_COLOR,
                size: 50.0
              ),
              SizedBox(height: 40,),
              Text("Retrieving the Event Info...", style: LOADING_TEXT_STYLE),
            ]
    )
    )
    );
  }

}
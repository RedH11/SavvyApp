import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:cryptoapp/screens/widgets/events_display.dart';
import 'package:cryptoapp/screens/widgets/white_container.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// In the future can make it a live coin count
///
class EventsInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Get Event Name and Emoji
    var eventName = "🔥 Blitz Event #5";

    return Scaffold(
      appBar: TopAppBar().getAppBar(eventName, false, true, context),
      body: EventsInfoBody(),
    );
  }
}

class EventsInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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

    var eventDescription = "$eventName #$eventNumber aims to $eventAim";
    var eventRecord = "";

    if (thereIsARecord) {
      eventRecord = "The RECORD for a $eventAbbrv is \$$eventRecordNum achieved during $eventName #$eventRecordNumber";
    }
    else {
      eventRecord = "There is currently no all time record for this event...until after this one!";
    }

    var eventLockdown = "The event will last $eventLockdownTime, and earnings will be received on $earningsReceivedDate";

    var timerValue = "00:00:00";
    var spotsRemaining = "0";
    var coinsInvested = "0";

    var eventsDisplay = EventsDisplay();
    
    var descriptionText = eventsDisplay.getDescriptionBlock("🤔", eventDescription);
    var recordText = eventsDisplay.getDescriptionBlock("🚀", eventRecord);
    var lockdownText = eventsDisplay.getDescriptionBlock("🕰", eventLockdown);

    var countdownTimer = Text(timerValue, style: EVENT_DESCRIPTION_TIMER_STYLE,);
    var spotsRemainingText = Text("$spotsRemaining spots open!", style: EVENT_DESCRIPTION_SPOTS_STYLE);
    var coinsInvestedText = eventsDisplay.getCoinsDisplay(coinsInvested);

    return Container(
      color: backgroundColor,
      child: Column(children: [
        WhiteContainer.init(
            10.0,
            [
              SizedBox(height: 10,),
              descriptionText,
              recordText,
              lockdownText,
              SizedBox(height: 20,),
              countdownTimer,
              spotsRemainingText,
              SizedBox(height: 20,),
              coinsInvestedText,
              SizedBox(height: 10,)
            ]
        ),
        SizedBox(height: 40,),
        eventsDisplay.getJoinEventButton(eventID)
      ],
      )
    );
  }


}
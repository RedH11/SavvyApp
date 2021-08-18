import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

class HomeDisplay {

  String getEventEmoji(eventAbbrv) {
    return EVENT_EMOJIS[eventAbbrv] ?? "🚀";
  }

  Color getEventColor(eventAbbrv) {
    return EVENT_COLORS[eventAbbrv] ?? MAINSTREAM_EVENT_COLOR;
  }

  Widget getUserEventContainer(curEventInfo) {
    Color curColor = getEventColor(curEventInfo.abbrv);
    String curEmoji = getEventEmoji(curEventInfo.abbrv);
    String eventTitle = curEventInfo.title;
    int eventTimeLeft = DateTime
        .now()
        .difference(curEventInfo.startTime)
        .inDays;
    String eventDuration = "Ends in $eventTimeLeft Days";
    String eventProfitLoss = curEventInfo.changePercentage;

    Widget topRow = Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Row(
          children: [
            Text(curEmoji)
          ],
        ));

    Widget eventBody = Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Column(
        children: <Widget>[
          Text(eventTitle, style: HOME_USER_EVENT_TITLE_STYLE),
          Text(eventDuration, style: HOME_USER_EVENT_DURATION_STYLE),
          Text(eventProfitLoss, style: HOME_USER_EVENT_PERCENTAGE_STYLE,)
        ],
      ),
    );

    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
          color: curColor,
          borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
      ),
      child: Column(
        children: <Widget>[
          topRow,
          eventBody
        ],
      ),
    );
  }

  String getTimerEmoji(var timeLeftSeconds) {
    double twoDaysInSeconds = 172800;

    if (timeLeftSeconds > twoDaysInSeconds) {
      return "❗️";
    } else {
      return "‼️";
    }
  }

  Widget getNewEventContainer(Map<String, dynamic> curEvent, utcOffset) {

    String eventAbbrv = curEvent['abbrv'];
    Color curColor = getEventColor(eventAbbrv);
    String curEmoji = getEventEmoji(eventAbbrv);

    DateTime eventStartTime = (curEvent['startTime'] as Timestamp).toDate();

    var eventTimeLeftToStart = -1 * DateTime.now().difference(eventStartTime).inSeconds;

    String curTimerEmoji = "⏳";
    String spotsOpen = "";


    // Checks if the event is open to be joined (starts in less than the non-live time)
    bool eventIsJoinable = ((DateTime.now().difference(eventStartTime).inDays).abs() <= EVENT_LIVE_TIME);

    Widget eventTimer;

    if (eventIsJoinable) {
      curTimerEmoji = getTimerEmoji(eventTimeLeftToStart);
      var numSpotsOpen = curEvent['open_spots'];
      spotsOpen = "$numSpotsOpen Spots Open";

      var countdownEndTime = eventStartTime.millisecondsSinceEpoch + 1000 * 30;

      eventTimer = CountdownTimer(
        endTime: countdownEndTime,
        widgetBuilder: (BuildContext ctx, CurrentRemainingTime? time) {
          if (time == null) {
            return Text('Event Started!');
          }

          // Convert the days left into hours left
          int daysLeftInHours = (time.days ?? 0) * 24;
          int hoursLeft = (time.hours ?? 0) + daysLeftInHours;

          // Make the hours always display double digits
          String hoursInTimer;

          if (hoursLeft < 10) {
            hoursInTimer = "0$hoursLeft";
          } else {
            hoursInTimer = hoursLeft.toString();
          }

          // Make the minutes always display double digits
          String minutesInTimer;

          if ((time.min ?? 0) < 10) {
            minutesInTimer = "0${time.min}";
          } else {
            minutesInTimer = time.min.toString();
          }

          // Make the seconds always display double digits
          String secondsInTimer;

          if ((time.sec ?? 0) < 10) {
            secondsInTimer = "0${time.sec}";
          } else {
            secondsInTimer = time.sec.toString();
          }

          return Text(
              '$hoursInTimer:$minutesInTimer:$secondsInTimer TO JOIN', style: eventTimerStyle);
        },
      );
    } else {
      // If the event isn't live, show the date when it will be
      String formattedDate = DateFormat('MM/dd, ha').format(eventStartTime).toLowerCase();
      String eventStartString = "🚀 $formattedDate";
      eventTimer = Text(eventStartString, style: eventTimerStyle,);

      spotsOpen = "Starting Soon";
    }

    curTimerEmoji = getTimerEmoji(eventTimeLeftToStart);

    return Row(
        children: <Widget>[
          // Padding to separate it from the white container
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child:
              // Event Body
              Container(
                height: 60,
                width: 260,
                decoration:
                BoxDecoration(
                    color: curColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(containerRoundness))
                ),
                // Event body text
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(curEmoji, style: TextStyle(fontSize: 22)),
                    SizedBox(width: 10),
                    // Column with title and # of spots open
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(eventAbbrv, style: eventTitleStyle),
                        SizedBox(height: 3),
                        Text(spotsOpen, style: eventSubtitleStyle),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Expanded(flex: 2, child: Align(alignment: Alignment.centerRight, child: eventTimer))
                  ],
                ),
                )
              )
          ),
          SizedBox(width: 10,),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(curTimerEmoji, style: HOME_TIMER_EMOJI_STYLE,))
        ]
    );
  }

  Widget getUserEventsDisplay(userEvents, utcOffset) {
    List<Widget> allUserEvents = [];
    var event;

    for (event in userEvents) {
      allUserEvents.add(getUserEventContainer(event));
    }

    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 100, minHeight: 0.0),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: allUserEvents,
        ),
      )
    );
  }

  Widget getAllEventsDisplay(QuerySnapshot allEvents, utcOffset) {

    List<Widget> allEventContainers = [];

    for (QueryDocumentSnapshot event in allEvents.docs) {
       Map<String, dynamic>? eventData = event.data() as Map<String, dynamic>?;

       DateTime eventStartTime = (eventData?['startTime'] as Timestamp).toDate();
       var timeToStart = DateTime.now().difference(eventStartTime).inSeconds;

       // If the event hasn't already started, (the difference is negative)
       if (timeToStart < 0) {
         allEventContainers.add(getNewEventContainer(eventData!, utcOffset));
       }
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500, minHeight: 0.0),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
        children: allEventContainers,
      )),
    );
  }
}
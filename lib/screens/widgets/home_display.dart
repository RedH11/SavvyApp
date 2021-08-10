import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

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

  Widget getNewEventContainer(curEvent, utcOffset) {

    ///
    /// Make sure that when the navigation to the event info page occurs
    /// That you don't send it on if the event is unjoinable
    ///

    Color curColor = getEventColor(curEvent.abbrv);
    String curEmoji = getEventEmoji(curEvent.abbrv);
    String eventAbbrv = curEvent.abbrv;
    // Checks if the event is open to be joined
    bool eventIsLive = (DateTime
        .now()
        .difference(curEvent.startTime)
        .inDays <= EVENT_LIVE_TIME);

    var eventTimeLeftToStart = -1 * DateTime
        .now()
        .difference(curEvent.startTime)
        .inSeconds;

    String curTimerEmoji = "⏳";

    if (eventIsLive) {
      curTimerEmoji = getTimerEmoji(eventTimeLeftToStart);
    }

    curTimerEmoji = getTimerEmoji(eventTimeLeftToStart);

    CountdownTimer eventTimer = CountdownTimer(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * eventTimeLeftToStart,
      textStyle: eventTimerStyle,
    );

    return Row(
        children: <Widget>[
          // Padding to separate it from the white container
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child:
              // Event Body
              Container(
                height: 80,
                width: 300,
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
                    Text(curEmoji, style: TextStyle(fontSize: 30)),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(eventAbbrv, style: eventTitleStyle),
                        SizedBox(height: 5),
                        Text("2 Spots Open", style: eventSubtitleStyle),
                      ],
                    ),
                    SizedBox(width: 40,),
                    eventTimer
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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: allUserEvents,
      ),
    );
  }

  Widget getAllEventsDisplay(allEvents, utcOffset) {
    List<Widget> allEventContainers = [];
    var event;

    for (event in allEvents) {
      allEventContainers.add(getNewEventContainer(event, utcOffset));
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
          height: 200.0,
          child: ListView(
        scrollDirection: Axis.horizontal,
        children: allEventContainers,
      )),
    );
  }
}
import 'package:cryptoapp/screens/intro/rewards_descr.dart';
import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

import 'widget_components/intro_buttons.dart';

class EventDescrBody extends StatelessWidget {

  Widget _getEventBody(eventTitleStyle, eventSubtitleStyle, eventTimerStyle, emojiSize, eventSpacing, eventHeight) {
    return Row(
        children: <Widget>[
          // Padding to separate it from the white container
          Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
              child:
              // Red event body
              Container(
                  height: eventHeight,
                  decoration:
                  BoxDecoration(
                      color: BLITZ_EVENT_COLOR,
                      borderRadius: BorderRadius.all(
                          Radius.circular(containerRoundness))
                  ),
                  // Event body text
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("🔥", style: TextStyle(fontSize: emojiSize)),
                        SizedBox(width: eventSpacing),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("BLZ", style: eventTitleStyle),
                            SizedBox(height: 5),
                            Text("2 Spots Open", style: eventSubtitleStyle),
                          ],
                        ),
                        SizedBox(width: eventSpacing,),
                        Text("00:33:23 TO JOIN", style: eventTimerStyle)
                      ],
                    ),
                  )))
        ]
    );
  }

  @override
  Widget build(BuildContext context) {

    ///
    /// Primary Container (Background)
    ///
    return DynamicWidgetBuilder(
        builder: (context, sizingInformation) {

          Widget nextPageButton;
          TextStyle bodyTextStyle;
          Widget eventBody;
          TextStyle eventTitleStyle;
          TextStyle eventSubtitleStyle;
          TextStyle eventTimerStyle;
          TextStyle sectionTitleStyle;
          double emojiSize;
          double eventSpacing;
          double eventHeight;

          double screenHeight = sizingInformation.screenSize.height;

          // Small screen
          if (screenHeight < SMALL_SCREEN) {
            nextPageButton = NextPageButton.init(context, RewardsDescr(), 20.0, 10.0);
            bodyTextStyle = MAIN_BODY_SMALL_STYLE;

            eventTitleStyle = EVENT_TITLE_SMALL_STYLE;
            eventSubtitleStyle = EVENT_SUBTITLE_SMALL_STYLE;
            eventTimerStyle = EVENT_TIMER_SMALL_STYLE;
            sectionTitleStyle = SECTION_TITLE_SMALL_STYLE;
            emojiSize = 22;
            eventSpacing = 15;
            eventHeight = 60;
            eventBody = _getEventBody(eventTitleStyle, eventSubtitleStyle, eventTimerStyle, emojiSize, eventSpacing, eventHeight);

            // Large screen
          } else if (screenHeight > LARGE_SCREEN) {
            nextPageButton = NextPageButton.init(context, RewardsDescr(), 40.0, 15.0);
            bodyTextStyle = MAIN_BODY_LARGE_STYLE;

            eventTitleStyle = EVENT_TITLE_LARGE_STYLE;
            eventSubtitleStyle = EVENT_SUBTITLE_LARGE_STYLE;
            eventTimerStyle = EVENT_TIMER_LARGE_STYLE;
            sectionTitleStyle = SECTION_TITLE_LARGE_STYLE;
            emojiSize = 30;
            eventSpacing = 20;
            eventHeight = 100;
            eventBody = _getEventBody(eventTitleStyle, eventSubtitleStyle, eventTimerStyle, emojiSize, eventSpacing, eventHeight);

            // Medium screen
          } else {
            nextPageButton = NextPageButton.init(context, RewardsDescr(), 26.0, 10.0);
            bodyTextStyle = MAIN_BODY_STYLE;

            eventTitleStyle = EVENT_TITLE_STYLE;
            eventSubtitleStyle = EVENT_SUBTITLE_STYLE;
            eventTimerStyle = EVENT_TIMER_STYLE;
            sectionTitleStyle = SECTION_TITLE_STYLE;
            emojiSize = 34;
            eventSpacing = 10;
            eventHeight = 80;
            eventBody = _getEventBody(eventTitleStyle, eventSubtitleStyle, eventTimerStyle, emojiSize, eventSpacing, eventHeight);
            }

          Widget sectionTitle = Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child:
                  Text("🤔 So How Do Events Work?", textAlign: TextAlign.left,
                      style: sectionTitleStyle)
              )
          );
          
          return Container(
              color: backgroundColor,
              // 100$ of screen height
              height: double.infinity,
              // 100% of screen width
              width: double.infinity,

              // Main Column
              child: Column(
                children: <Widget>[

                  SizedBox(height: 20,),

                  // Event Body Container
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Container(
                          width: double.infinity,
                          decoration:
                          BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(containerRoundness))
                          ),
                          child: Column(
                              children: <Widget>[
                                sectionTitle,
                                eventBody
                              ]
                          )
                      )
                  ),

                  SizedBox(height: 10,),

                  // Event Description Container
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Container(
                          width: double.infinity,
                          decoration:
                          BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(containerRoundness))
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        "🔥 This a Blitz event, its aim is high reward high risk investing\n",
                                        style: bodyTextStyle),
                                    Text(
                                        "💎 You join and decide how much to invest\n",
                                        style: bodyTextStyle),
                                    Text(
                                        "☕️ The timer counts down to event's start, and then our Savants get to work\n",
                                        style: bodyTextStyle),
                                    Text(
                                        "📈 The assets from everyone are invested in the event's aims\n",
                                        style: bodyTextStyle),
                                    Text(
                                        "🚀 And when the event finishes, your earnings are transferred to your wallet\n",
                                        style: bodyTextStyle),
                                  ]
                              )
                          )
                      )
                  ),
                  SizedBox(height: 40,),
                  Expanded(child: nextPageButton)
                ],
              )
          );
        });
  }
}
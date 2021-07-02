import 'package:cryptoapp/screens/intro/rewards_descr.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class EventDescrBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget sectionTitle = Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Align(
            alignment: Alignment.topLeft,
            child:
            Text("🤔 So How Do Events Work?", textAlign: TextAlign.left, style: Theme.of(context)
                .textTheme
                .headline2
            )
        )
    );

  Widget eventBody = Row(
      children: <Widget>[
        // Padding to separate it from the white container
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:
            // Red event body
            Container(
              height: 100,
              width: 310,
              decoration:
              BoxDecoration(
                  color: blitzEventColor,
                  borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
              ),
              // Event body text
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("🔥", style: TextStyle(fontSize: 30)),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("BLZ", style: eventTitleStyle),
                      SizedBox(height: 5),
                      Text("2 Spots Open", style: eventSubtitleStyle),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Text("06:33:23 TO JOIN", style: eventTimerStyle)
                ],
              ),
          )
        )
      ]
    );

    Widget nextPageButton = Align(
        alignment: Alignment.bottomRight, child:  Container(
        margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 0),
        decoration:
          BoxDecoration(
            color: primaryButtonColor,
            shape: BoxShape.circle,
          ),
        child: new IconButton(icon: new Icon(Icons.arrow_forward_ios, color: Colors.white,),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RewardsDescr()),
            )
         ),
      )
    );

    ///
    /// Primary Container (Background)
    ///
    return Container(
        color: backgroundColor,
        // 100$ of screen height
        height: double.infinity,
        // 100% of screen width
        width: double.infinity,

        // Main Column
        child: Column(
          children: <Widget>[

            // Event Body Container
            Padding(
              padding: EdgeInsets.fromLTRB(sidePadding, 50, sidePadding, 5),
              child: Container(
                width: double.infinity,
                decoration:
                  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
                  ),
                child: Column(
                  children: <Widget>[
                    sectionTitle,
                    eventBody
                  ]
                )
              )
            ),
            // Event Description Container
            Padding(
                padding: EdgeInsets.fromLTRB(sidePadding, 5, sidePadding, 40),
                child: Container(
                    width: double.infinity,
                    decoration:
                    BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("🔥 This is one of our rare BLITZ events\n", style: mainBody),
                            Text("🎯 Each event has an aim, a BLITZ is high reward high risk investing\n", style: mainBody),
                            Text("💎 You join with your \$SavvyCoins and decide how much to invest\n", style: mainBody),
                            Text("☕️ The timer counts down to event's start, and then our Savants get to work\n", style: mainBody),
                            Text("📈 During the event they constantly invest and monitor the assets\n", style: mainBody),
                            Text("🚀 And when the event finishes, you get the returns on your coins invested\n", style: mainBody),
                            Text("‼️ Just don't wait too long, there are a limited amount of slots for each event!\n", style: mainBody),
                          ]
                    )
                    )
                )
            ),

            nextPageButton
          ],
        )
      );
  }
}
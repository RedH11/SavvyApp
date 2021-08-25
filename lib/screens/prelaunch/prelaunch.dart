import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/screens/widgets/loading.dart';
import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:lottie/lottie.dart';

class PrelaunchScreen extends StatelessWidget {

  final Scaffold loadingScreen = LoadingWidget().getLoadingScreen();

  Future<Timestamp> _getLaunchTime() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var launchDate = await _firestore.collection('info').doc('launch_date').get();

    return (launchDate.get('date') ?? Timestamp.fromDate(DateTime.parse("09/01/2021")));
  }
  
  Widget _getPrelaunchTimer(DateTime appStartTime) {

    var endTime = appStartTime.millisecondsSinceEpoch + 1000 * 30;

    return CountdownTimer(
      endTime: endTime,
      widgetBuilder: (BuildContext ctx, CurrentRemainingTime? time) {
        if (time == null) {
          return Text('App Starting!');
        }

        int daysLeft = time.days ?? 0;

        // Make the days always display double digits
        String daysInTimer;

        if (daysLeft < 10) {
          daysInTimer = "0$daysLeft";
        } else {
          daysInTimer = daysLeft.toString();
        }

        // Convert the days left into hours left
        int hoursLeft = (time.hours ?? 0);

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

        var gridItems = [];

        // Days
        gridItems.add(
            RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: '$daysInTimer', style: PRELAUNCH_TIMER_STYLE),
            ]
          )
          )
        );

        // Hours
        gridItems.add(
            RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$hoursInTimer', style: PRELAUNCH_TIMER_STYLE),
                ]
            )
            )
        );


        // Minutes
        gridItems.add(
            RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$minutesInTimer', style: PRELAUNCH_TIMER_STYLE),
                ]
            )
            )
        );

        // Seconds
        gridItems.add(
            RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$secondsInTimer', style: PRELAUNCH_TIMER_STYLE),
                ]
            )
            )
        );

        gridItems.add(
          RichText(text: TextSpan(
            children: const <TextSpan>[
            TextSpan(text: 'D', style: PRELAUNCH_TIMER_LABEL_COLORED_STYLE),
            TextSpan(text: 'ays', style: PRELAUNCH_TIMER_LABEL_STYLE),
          ])
          )
        );

        gridItems.add(
            RichText(text: TextSpan(
                children: const <TextSpan>[
                  TextSpan(text: 'H', style: PRELAUNCH_TIMER_LABEL_COLORED_STYLE),
                  TextSpan(text: 'ours', style: PRELAUNCH_TIMER_LABEL_STYLE),
                ])
            )
        );

        gridItems.add(
            RichText(text: TextSpan(
                children: const <TextSpan>[
                  TextSpan(text: 'M', style: PRELAUNCH_TIMER_LABEL_COLORED_STYLE),
                  TextSpan(text: 'inutes', style: PRELAUNCH_TIMER_LABEL_STYLE),
                ])
            )
        );

        gridItems.add(
            RichText(text: TextSpan(
                children: const <TextSpan>[
                  TextSpan(text: 'S', style: PRELAUNCH_TIMER_LABEL_COLORED_STYLE),
                  TextSpan(text: 'econds', style: PRELAUNCH_TIMER_LABEL_STYLE),
                ])
            )
        );
        
        return SizedBox(
            height: 300,
            width: 300,
            child: GridView.builder(
              primary: true,
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0
            ),
          itemBuilder: (BuildContext context, int index) {
            return (gridItems[index]);
          },
        ));
      },
    );
  }

  Widget _getPrelaunchBody(Timestamp launchDate) {

    var rocketGif = Lottie.asset(
      './lib/assets/green_rocket.json',
      repeat: true,
      reverse: false,
      animate: true,
    );
        
    DateTime appStartTime = (launchDate).toDate();
    
    var timer = _getPrelaunchTimer(appStartTime);

    return DynamicWidgetBuilder(
        builder: (context, sizingInformation) {

          Widget nextPageButton;
          EdgeInsets mainPadding;
          TextStyle bodyTextStyle;

          double screenHeight = sizingInformation.screenSize.height;

          // Small screen
          if (screenHeight < SMALL_SCREEN) {
            mainPadding = EdgeInsets.fromLTRB(
                sidePadding, 20, sidePadding, 5);
            bodyTextStyle = MAIN_BODY_SMALL_STYLE;

            // Large screen
          } else if (screenHeight > LARGE_SCREEN) {
            mainPadding = EdgeInsets.fromLTRB(
                sidePadding, 50, sidePadding, 5);
            bodyTextStyle = MAIN_BODY_LARGE_STYLE;

            // Medium screen
          } else {
            mainPadding = EdgeInsets.fromLTRB(
                sidePadding, 80, sidePadding, 5);
            bodyTextStyle = MAIN_BODY_STYLE;
          }

        return Scaffold(
      backgroundColor: backgroundColor,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 200, width: 200, child: rocketGif,),
                SizedBox(height: 30,),
                Text("\$Savvy", style: PRELAUNCH_HEADING_STYLE),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: secondaryTextColor,
                    size: 24.0,
                  ),
                  Text(" St. Andrews, Scotland", style: PRELAUNCH_BODY_STYLE)
                ],),
                SizedBox(height: 60,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: timer
                    ),
                  ],
                )
              ],
            )
        )
    );});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Timestamp>(
        future: _getLaunchTime(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        print("snapshot error in prelaunch");
        return loadingScreen;
      } else if (snapshot.hasData) {
        Timestamp? launchDate = snapshot.data;
        return _getPrelaunchBody(launchDate!);
      } else {
        return loadingScreen;
      }
    }
    );
  }

}
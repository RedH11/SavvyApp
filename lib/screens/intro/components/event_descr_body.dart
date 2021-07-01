import 'package:cryptoapp/screens/intro/rewards_descr.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class EventDescrBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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

            // Main Body Container
            Padding(
              padding: EdgeInsets.fromLTRB(sidePadding, topPadding, sidePadding, 40),
              child: Container(
                width: double.infinity,
                decoration:
                  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
                  ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child:
                            Text("🤔 How Do Events Work?", textAlign: TextAlign.left, style: Theme.of(context)
                                .textTheme
                                .headline2

                                ///
                              ///
                              /// Explain how events will be posted by the Savants behind the scenes
                              ///
                              ///
                              ///
                            )
                          )
                        )
                  ],
                )
              )
            ),

            // Next Page Button
            Align(
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
            ),
          ]
        )

    );
  }
}
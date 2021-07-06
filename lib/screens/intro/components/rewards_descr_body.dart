import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/intro/components/goal.dart';
import 'package:cryptoapp/screens/intro/components/level_progress_bar.dart';
import 'package:cryptoapp/screens/intro/components/section_title.dart';
import 'package:cryptoapp/screens/intro/components/white_container.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:cryptoapp/screens/intro/components/intro_buttons.dart';
import 'package:flutter/material.dart';

import 'left_align_text.dart';

class RewardsDescrBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget nextPageButton = NextPageButton.init(context, IntroScreen());

    RichText rewardDescrTitle = new RichText(
        text: new TextSpan(
            style: sectionTitleStyle,
            children: <TextSpan>[
              new TextSpan(text: 'And we want to '),
              new TextSpan(text: 'reward you ', style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(text: 'for investing 🏅'),
            ]
        )
    );

    Padding levelProgressBar = Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child:
        LevelProgressBar(max: 100, current: 10)
    );

    Padding levelDisplay = LeftAlignText.align(Text("Level 1", style: levelDisplayStyle,));

    Padding goalsTitle = LeftAlignText.align(Text("#Goals", style: goalsTitleStyle));

    Align redeemRewardsBtn = RedeemRewardsButton.init();

    Padding exGoalOne = Goal.init();

    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          // Event Body Container
          WhiteContainer.init(50.0, [
            SizedBox(height: 20,),
            SectionTitle.init(rewardDescrTitle),
            SizedBox(height: 10,),
            levelDisplay,
            levelProgressBar,
            SizedBox(height: 10,),
            redeemRewardsBtn,
            goalsTitle,
            exGoalOne
          ]
          ),
          WhiteContainer.init(10.0, [
            SectionTitle.init(rewardDescrTitle)
          ]),
          nextPageButton
        ],
      )
    );
  }
}
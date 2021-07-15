import 'package:cryptoapp/models/all_goals.dart';
import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/goal_display.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/level_progress_bar.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/section_title.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/white_container.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/intro_buttons.dart';
import 'package:flutter/material.dart';

import 'widget_components/left_align_text.dart';

class RewardsDescrBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget finalNextPageButton = FinalNextPageButton.init(context, IntroScreen());

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

    Padding exGoalOne = GoalDisplay.init(allGoals[0]);
    Padding exGoalTwo = GoalDisplay.init(allGoals[1]);

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
            exGoalOne,
            exGoalTwo,
            SizedBox(height: 20,)
          ]
          ),
          WhiteContainer.init(10.0, [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("🍾 Your level increases by completing #Goals \n", style: mainBodyStyle),
                      Text("👀 And each time you level up you get a mystery reward\n", style: mainBodyStyle),
                      Text("💎 They include NFT's from local artists, extra invites, and exclusive access to \$Savvy in-person events,\n", style: mainBodyStyle),
                      Text("🏅 So you'll want to complete as many goals as you can!\n", style: mainBodyStyle),
                    ]
                )
            )
          ]),
          SizedBox(height: 20,),
          finalNextPageButton
        ],
      )
    );
  }
}
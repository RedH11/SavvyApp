import 'package:cryptoapp/models/all_goals.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/goal_display.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/intro_buttons.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/level_progress_bar.dart';
import 'package:cryptoapp/screens/intro/components/widget_components/section_title.dart';
import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:cryptoapp/screens/widgets/white_container.dart';
import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

import 'widget_components/left_align_text.dart';

class RewardsDescrBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Padding levelProgressBar = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: LevelProgressBar(max: 100, current: 10));

    return DynamicWidgetBuilder(builder: (context, sizingInformation) {
      Widget nextPageButton;
      TextStyle levelDisplayStyle;
      TextStyle goalsTitleStyle;
      TextStyle goalDisplayStyle;
      TextStyle bodyTextStyle;
      TextStyle sectionTitleStyle;
      TextStyle sectionTitleBoldStyle;
      TextStyle finalNextButtonStyle;
      double goalWidth;
      double goalHeight;
      var nextScreen = ParentPhoneNumScreen();

      double screenHeight = sizingInformation.screenSize.height;

      // Small screen
      if (screenHeight < SMALL_SCREEN) {
        finalNextButtonStyle = FINAL_NEXT_PAGE_BUTTON_SMALL_STYLE;
        nextPageButton = FinalNextPageButton.init(
            context, nextScreen, 40.0, finalNextButtonStyle);
        levelDisplayStyle = LEVEL_DISPLAY_SMALL_STYLE;
        goalsTitleStyle = GOALS_TITLE_SMALL_STYLE;
        goalDisplayStyle = GOAL_DISPLAY_SMALL_STYLE;
        bodyTextStyle = MAIN_BODY_SMALL_STYLE;
        sectionTitleStyle = SECTION_TITLE_SMALL_STYLE;
        sectionTitleBoldStyle = SECTION_TITLE_BOLD_SMALL_STYLE;
        goalWidth = 180;
        goalHeight = 30;

        // Large screen
      } else if (screenHeight > LARGE_SCREEN) {
        finalNextButtonStyle = FINAL_NEXT_PAGE_BUTTON_LARGE_STYLE;
        nextPageButton = FinalNextPageButton.init(
            context, nextScreen, 60.0, finalNextButtonStyle);
        levelDisplayStyle = LEVEL_DISPLAY_LARGE_STYLE;
        goalsTitleStyle = GOALS_TITLE_LARGE_STYLE;
        goalDisplayStyle = GOAL_DISPLAY_LARGE_STYLE;
        bodyTextStyle = MAIN_BODY_LARGE_STYLE;
        sectionTitleStyle = SECTION_TITLE_LARGE_STYLE;
        sectionTitleBoldStyle = SECTION_TITLE_BOLD_LARGE_STYLE;
        goalWidth = 260;
        goalHeight = 40;

        // Medium screen
      } else {
        finalNextButtonStyle = FINAL_NEXT_PAGE_BUTTON_STYLE;
        nextPageButton = FinalNextPageButton.init(
            context, nextScreen, 50.0, finalNextButtonStyle);
        levelDisplayStyle = LEVEL_DISPLAY_STYLE;
        goalsTitleStyle = GOALS_TITLE_STYLE;
        goalDisplayStyle = GOAL_DISPLAY_STYLE;
        bodyTextStyle = MAIN_BODY_STYLE;
        sectionTitleStyle = SECTION_TITLE_STYLE;
        sectionTitleBoldStyle = SECTION_TITLE_BOLD_STYLE;
        goalWidth = 220;
        goalHeight = 36;
      }

      Padding levelDisplay =
          LeftAlignText.align(Text("Level 1", style: levelDisplayStyle), 20.0);

      Padding goalsTitle =
          LeftAlignText.align(Text("#Goals", style: goalsTitleStyle), 20.0);

      Padding exGoalOne = GoalDisplay.init(
          allGoals[0], goalDisplayStyle, goalWidth, goalHeight);

      RichText rewardDescrTitle = new RichText(
          text: new TextSpan(style: SECTION_TITLE_STYLE, children: <TextSpan>[
        new TextSpan(text: 'And we ', style: sectionTitleStyle),
        new TextSpan(text: 'reward you ', style: sectionTitleBoldStyle),
        new TextSpan(text: 'for investing 🏅', style: sectionTitleStyle),
      ]));

      return Container(
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              // Event Body Container
              WhiteContainer.init(20.0, [
                SizedBox(
                  height: 20,
                ),
                SectionTitle.init(rewardDescrTitle),
                SizedBox(
                  height: 10,
                ),
                levelDisplay,
                levelProgressBar,
                SizedBox(
                  height: 10,
                ),
                goalsTitle,
                exGoalOne,
                SizedBox(
                  height: 20,
                )
              ]),
              WhiteContainer.init(10.0, [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "🍾 Your level increases by completing #Goals \n",
                              style: bodyTextStyle),
                          Text(
                              "👀 And each level up unlocks a mystery reward\n",
                              style: bodyTextStyle),
                          Text(
                              "💎 They include NFT's from local artists, extra invites, and exclusive access to \$Savvy in-person events,\n",
                              style: bodyTextStyle),
                        ]))
              ]),
              SizedBox(
                height: 20,
              ),
              nextPageButton
            ],
          ));
    });
  }
}

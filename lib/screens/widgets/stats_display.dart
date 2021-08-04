import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alignment_padding.dart';

class StatsDisplay {

  Padding getMainText(freeCoinsVal, totalCoinsVal) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: <Widget>[
            // Coins that are avaliable to be used
            Text(freeCoinsVal.toString(), style: STATS_COIN_VAL_STYLE,),
            // Coin Icon (TEMPORARY AS EMOJI)
            Text("🪙"),
            // Total coins owned
            Text("/ " + totalCoinsVal.toString(), style: STATS_COIN_VAL_STYLE,)
          ],
        )
    );
  }

  Padding getTitle(titleText){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(titleText, style: STATS_SECTION_TITLE_STYLE)
    );
  }

  Padding getDisplay(leftText, rightText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(leftText, style: STATS_BODY_STYLE),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(rightText, style: STATS_BODY_STYLE),
          )
        ],
      ),
    );
  }

  Padding getBoldDisplay(leftText, rightText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(leftText, style: STATS_BODY_BOLD_STYLE),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(rightText, style: STATS_BODY_BOLD_STYLE),
          )
        ],
      ),
    );
  }

  // Stats display, but the right text is green
  Padding getMoneyDisplay(leftText, rightText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(leftText, style: STATS_BODY_BOLD_STYLE),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(rightText, style: STATS_BODY_MONEY_STYLE),
          )
        ],
      ),
    );
  }

  // Bolded stats display, but the right text is green
  Padding getBoldMoneyDisplay(leftText, rightText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(leftText, style: STATS_BODY_BOLD_STYLE),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(rightText, style: STATS_BODY_MONEY_BOLD_STYLE),
          )
        ],
      ),
    );
  }

  ///
  /// REWARDS SECTION
  ///

  Padding getLevelTitle(titleText) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(titleText, style: STATS_SECTION_TITLE_STYLE)
    );
  }

  Padding getLevelCounter(value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        child: LinearProgressIndicator(
          minHeight: 50,
          backgroundColor: PROGRESS_BAR_BACKGROUND_COLOR,
          valueColor: AlwaysStoppedAnimation<Color>(BUTTON_COLOR),
      ),
    )
    );
  }

  void redeemRewardsForUser(var userUID) {
    // REDEEM THE REWARD FOR THE USER
  }

  Padding getRedeemRewardsButton(var isEnabled, var userUID) {

    var currentColor = BUTTON_COLOR;

    if (isEnabled == false) {
      currentColor = FADED_BUTTON_COLOR;
    }

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Align(
          alignment: Alignment.bottomCenter, child:  Container(
            width: 100,
            height: 25,
            margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 0),
            decoration:
            BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: new TextButton(
                onPressed: () => {
                  if (isEnabled) {
                    redeemRewardsForUser(userUID)
                  }
                },
                child: Text("Redeem Rewards!", style: REDEEM_REWARDS_BUTTON_STYLE)
            )
            )
        ),
    );
  }

  Padding getGoalsTitle() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text("#Goals", style: STATS_GOALS_TITLE_STYLE)
    );
  }

  // Takes in a Map of <GoalName, Goal Progress> with the goal progress
  // already put in the format of "0/##"
  // and returns the widgets for the goals to be displayed
  Column getGoalsDisplay(Map<String, String> allGoals) {

    List<Padding> goalsForDisplay = [];

    for (String goalName in allGoals.keys) {

      String goalProgress = allGoals[goalName].toString();

      Align goalNameDisplay = AlignmentPadding.forWidget(
          Text(goalName, style: goalDisplayStyle,),
          Alignment.centerLeft,
          EdgeInsets.symmetric(vertical: 0, horizontal: 10)
      );

      Align goalCountDisplay = AlignmentPadding.forWidget(
          Text(goalProgress, style: goalDisplayStyle,),
          Alignment.centerRight,
          EdgeInsets.fromLTRB(20, 0, 0, 0)
      );

      var tempGoalDisplay = Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Container(
                  width: 250.0,
                  height: 30.0,
                  decoration:
                  BoxDecoration(
                      color: treeGreenEventColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: goalNameDisplay
              ),
              goalCountDisplay
            ],
          ),
        ),
      );

      goalsForDisplay.add(tempGoalDisplay);
    }

    return Column(children: goalsForDisplay,);
  }

}
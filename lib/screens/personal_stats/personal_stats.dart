import 'package:cryptoapp/screens/intro/components/widget_components/level_progress_bar.dart';
import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:cryptoapp/screens/widgets/stats_display.dart';
import 'package:cryptoapp/screens/widgets/white_container.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalStatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Get user data for the stats container / rewards container

    var investedCoins = 0;
    var totalCoins = 0;
    var investmentVal = 0.00;
    var netWorth = 0.00;
    var rewardsLevel = 0;
    var levelCounter = 0.0;
    var rewardsAvailable = false;
    var userUID = "";
    var allGoals = {"Example Goal" : "0/5"};

    var statsDisplay = StatsDisplay();

    var summaryDivider = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
          color: DIVIDER_COLOR,
        thickness: 1.0,
      ),
    );

    var statsContainer = WhiteContainer.init(
        10.0,
        <Widget>[
              statsDisplay.getTitle("🤩 Summary"),
              summaryDivider,
              statsDisplay.getDisplay("Invested Coins", investedCoins.toString()),
              summaryDivider,
              statsDisplay.getDisplay("Total Coins", totalCoins.toString()),
              summaryDivider,
              statsDisplay.getMoneyDisplay("Investment Value", "\$" + investmentVal.toString()),
              summaryDivider,
              statsDisplay.getBoldMoneyDisplay("Net Worth", "\$" + netWorth.toString()),
              SizedBox(height: 10,)
      ]
    );

    var rewardsContainer = WhiteContainer.init(
      10.0,
      <Widget>[
        statsDisplay.getTitle("🏅 Rewards!"),
        SizedBox(height: 10,),
        statsDisplay.getLevelTitle("Level " + rewardsLevel.toString()),
        SizedBox(height: 15,),
        statsDisplay.getLevelCounter(levelCounter),
        SizedBox(height: 10,),
        statsDisplay.getRedeemRewardsButton(rewardsAvailable, userUID),
        SizedBox(height: 15,),
        statsDisplay.getGoalsTitle(),
        SizedBox(height: 10,),
        statsDisplay.getGoalsDisplay(allGoals),
        SizedBox(height: 10,)
      ]
    );

    // App bar variables
    bool hasNotification = false;
    bool useMenuIcons = false;
    bool useBackButton = true;

    return Scaffold(
      appBar: TopAppBar().getAppBar("Your \$SavvyCoins", useMenuIcons, useBackButton, hasNotification, context),
      body: Container(
        color: backgroundColor,
        child: Column(
            children: <Widget>[
              statsContainer,
              rewardsContainer
            ]
      ),
    ),
    );
  }
}
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
    var levelCounter = 0;
    var rewardsAvailable = false;
    var userUID = "";
    var allGoals = {"Example Goal" : "0/5"};

    var statsDisplay = StatsDisplay();

    var statsContainer = WhiteContainer.init(
        20.0,
        <Widget>[
              Text("🤩 Summary"),
              Divider(
              color: DIVIDER_COLOR
              ),

              statsDisplay.getDisplay("Invested Coins", investedCoins.toString()),
              Divider(
              color: DIVIDER_COLOR
              ),

              statsDisplay.getDisplay("Total Coins", totalCoins.toString()),
              Divider(
              color: DIVIDER_COLOR
              ),

              statsDisplay.getMoneyDisplay("Investment Value", "\$" + investmentVal.toString()),
              Divider(
              color: DIVIDER_COLOR
              ),
              statsDisplay.getBoldMoneyDisplay("Net Worth", "\$" + netWorth.toString())
      ]
    );

    var rewardsContainer = WhiteContainer.init(
      10.0,
      <Widget>[
        statsDisplay.getTitle("🏅 Rewards!"),
        SizedBox(height: 10,),
        statsDisplay.getLevelTitle("Level " + rewardsLevel.toString()),
        SizedBox(height: 10,),
        statsDisplay.getLevelTitle("Level " + rewardsLevel.toString()),
        SizedBox(height: 10,),
        statsDisplay.getLevelCounter(levelCounter),
        SizedBox(height: 5,),
        statsDisplay.getRedeemRewardsButton(rewardsAvailable, userUID),
        SizedBox(height: 5,),
        statsDisplay.getGoalsTitle(),
        SizedBox(height: 5,),
        statsDisplay.getGoalsDisplay(allGoals)
    ]
    );

    ///
    /// NEED TO MAKE IT SO THE GOALS ARE PROPERTY SET UP IN THE OTHER FILE
    ///

    return Scaffold(
      appBar: TopAppBar().getAppBar("Your \$SavvyCoins"),
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
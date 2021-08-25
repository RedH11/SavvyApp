import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class NextPageButton {

  static Align init(BuildContext context, nextScreen, buttonSize, buttonPadding) {
    return Align(
        alignment: Alignment.bottomRight, child:  Container(
        margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 40),
        decoration:
        BoxDecoration(
          color: BUTTON_COLOR,
          shape: BoxShape.circle,

        ),
        child: new IconButton(
          iconSize: buttonSize,
          padding: EdgeInsets.all(buttonPadding),
            icon: new Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => nextScreen),
          )
      ),
    )
    );
  }
}

class RedeemRewardsButton {

  static Align init() {
    return Align(
        alignment: Alignment.bottomRight, child:  Container(
      width: 130,
        height: 35,
        margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 0),
        decoration:
      BoxDecoration(
        color: FADED_BUTTON_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: new TextButton(
              onPressed: () {},
              child: Text("Redeem Rewards!", style: REDEEM_REWARDS_STYLE)
          )
      ),
    );
  }
}

class FinalNextPageButton {

  static Align init(BuildContext context, nextScreen, height, finalNextPageButtonStyle) {
    return Align(
      alignment: Alignment.bottomCenter, child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
        height: height,
        decoration:
        BoxDecoration(
            color: BUTTON_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: new TextButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => nextScreen)),
            child: Text("Let's Get Started!", style: finalNextPageButtonStyle)
        )
    )),
    );
  }
}
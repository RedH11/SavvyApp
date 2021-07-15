import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

class NextPageButton {

  static Align init(BuildContext context, nextScreen) {
    return Align(
        alignment: Alignment.bottomRight, child:  Container(
        margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 0),
        decoration:
        BoxDecoration(
          color: primaryButtonColor,
          shape: BoxShape.circle,
        ),
        child: new IconButton(
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
        color: fadedPrimaryButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: new TextButton(
              onPressed: () {},
              child: Text("Redeem Rewards!", style: redeemRewardsStyle)
          )
      ),
    );
  }
}

class FinalNextPageButton {

  static Align init(BuildContext context, nextScreen) {
    return Align(
      alignment: Alignment.bottomCenter, child:  Container(
        width: 300,
        height: 40,
        margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 0),
        decoration:
        BoxDecoration(
            color: primaryButtonColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: new TextButton(
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => nextScreen)),
            child: Text("Let's Get Started!", style: finalNextPageButtonStyle)
        )
    ),
    );
  }
}
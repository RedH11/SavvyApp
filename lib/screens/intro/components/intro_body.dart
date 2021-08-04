import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

import '../event_descr.dart';
import 'widget_components/intro_buttons.dart';


class IntroBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Defining main body text
    RichText bodyText = new RichText(
      text: new TextSpan(
        style: mainBodyStyle,
        children: <TextSpan>[
          new TextSpan(text: 'We want to '),
          new TextSpan(text: 'empower you ', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'to '),
          new TextSpan(text: 'invest in your dream future 🏖', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: '\n\nGet \$\$\$ compound earnings ', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'from '),
          new TextSpan(text: 'crypto-investments ', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'instead of having your money sit in a bank doing nothing 🏦'),
          new TextSpan(text: '\n\nWe are starting '),
          new TextSpan(text: 'a revolution ', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'to pool our resources together and profit in crypto-markets where '),
          new TextSpan(text: 'none of us can compete alone 💎', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: '\n\nWith your \$SavvyCoins, '),
          new TextSpan(text: 'join events ', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'investing in everything from '),
          new TextSpan(text: 'luxury Virtual Real-Estate to the hottest NFT\'s ✨', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: '\n\nAnd after the event ends, you '),
          new TextSpan(text: 'get your \$returns', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'straight into your personal fund 💳'),
          new TextSpan(text: '\n\nEvent better, we plan on officially listing our \$SavvyCoin for you to get MORE value 💵'),
          new TextSpan(text: '\n\nGet Rich, Get \$Savvy 🚀 ', style: new TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    Widget nextPageButton = NextPageButton.init(context, EventDescr());


    ///
    /// Main Container
    ///
    return Container(
        // 100$ of screen height
        height: double.infinity,
        // 100% of screen width
        width: double.infinity,

        child: Column(

          children: <Widget>[
            // Title Text
            Padding(
              padding: EdgeInsets.fromLTRB(40, 100, 0, 10),
              child:
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Welcome! 🥳", textAlign: TextAlign.left, style: Theme.of(context)
                        .textTheme
                        .headline1
                )
              ),
            ),

            // Body Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: bodyText
            ),
            SizedBox(height: 30),
            // Circular Next Button

            // Next Screen Button
            nextPageButton
          ],
        )
      );
  }
}

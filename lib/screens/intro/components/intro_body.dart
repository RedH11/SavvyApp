import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
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
        style: MAIN_BODY_STYLE,
        children: <TextSpan>[
          new TextSpan(text: 'We ', style: MAIN_BODY_STYLE),
          new TextSpan(text: 'empower you ', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: 'to ', style: MAIN_BODY_STYLE),
          new TextSpan(text: 'invest in your dream future 🏖', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: '\n\nGet \$\$\$ compound earnings ', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: 'from ', style: MAIN_BODY_STYLE),
          new TextSpan(text: 'crypto-investments ', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: 'instead of having your money sit in a bank doing nothing 🏦', style: MAIN_BODY_STYLE),
          new TextSpan(text: '\n\nWe ', style: MAIN_BODY_STYLE),
          new TextSpan(text: 'pool our resources ', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: 'and profit in crypto-markets where ', style: MAIN_BODY_STYLE),
          new TextSpan(text: 'none of us can compete alone 💎', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: '\n\nJoin events ', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: 'investing in everything from ', style: MAIN_BODY_STYLE),
          new TextSpan(text: 'luxury Virtual Real-Estate to the hottest NFT\'s ✨', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: '\n\nWhere your ', style: MAIN_BODY_STYLE),
          new TextSpan(text: '\$returns ', style: MAIN_BODY_BOLD_STYLE),
          new TextSpan(text: 'are put straight into your personal wallet 💳', style: MAIN_BODY_STYLE),
          new TextSpan(text: '\n\nGet Rich, Get \$Savvy 🚀 ', style: MAIN_BODY_BOLD_STYLE),
        ],
      ),
    );

    RichText bodyTextSmall = new RichText(
      text: new TextSpan(
        style: MAIN_BODY_STYLE,
        children: <TextSpan>[
          new TextSpan(text: 'Invest in your dream future 🏖', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: '\n\nWith \$\$\$ earnings ', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: 'from ', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: 'crypto-investments ', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: 'instead of your money sitting in a bank doing nothing 🏦', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: '\n\nWe ', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: 'pool our resources ', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: 'and profit in crypto-markets where ', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: 'none of us can compete alone 💎', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: '\n\nJoin events ', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: 'investing in everything from ', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: 'luxury Virtual Real-Estate to the hottest NFT\'s ✨', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: '\n\nWhere your ', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: '\$returns ', style: MAIN_BODY_BOLD_SMALL_STYLE),
          new TextSpan(text: 'are put straight into your personal wallet 💳', style: MAIN_BODY_SMALL_STYLE),
          new TextSpan(text: '\n\nGet Rich, Get \$Savvy 🚀 ', style: MAIN_BODY_BOLD_SMALL_STYLE),
        ],
      ),
    );

    RichText bodyTextLarge = new RichText(
      text: new TextSpan(
        style: MAIN_BODY_STYLE,
        children: <TextSpan>[
          new TextSpan(text: 'We ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: 'empower you ', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: 'to ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: 'invest in your dream future 🏖', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: '\n\nGet \$\$\$ compound earnings ', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: 'from ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: 'crypto-investments ', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: 'instead of having your money sit in a bank doing nothing 🏦', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: '\n\nWe ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: 'pool our resources ', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: 'and profit in crypto-markets where ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: 'none of us can compete alone 💎', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: '\n\nJoin events ', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: 'investing in everything from ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: 'luxury Virtual Real-Estate to the hottest NFT\'s ✨', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: '\n\nWhere your ', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: '\$returns ', style: MAIN_BODY_BOLD_LARGE_STYLE),
          new TextSpan(text: 'are put straight into your personal wallet 💳', style: MAIN_BODY_LARGE_STYLE),
          new TextSpan(text: '\n\nGet Rich, Get \$Savvy 🚀 ', style: MAIN_BODY_BOLD_LARGE_STYLE),
        ],
      ),
    );

    ///
    /// Main Container
    ///
    return DynamicWidgetBuilder(
      builder: (context, sizingInformation) {

        Widget mainBodyText;
        Widget headerText;
        Widget nextPageButton;
        EdgeInsets mainPadding;
        double topSpacing;

        double screenHeight = sizingInformation.screenSize.height;
        print(screenHeight);

        // Small screen
        if (screenHeight < SMALL_SCREEN) {
          headerText = Text("Welcome! 🥳", textAlign: TextAlign.left, style: MAIN_HEADING_SMALL_STYLE);
          mainBodyText = bodyTextSmall;
          nextPageButton = NextPageButton.init(context, EventDescr(), 20.0, 10.0);
          mainPadding = EdgeInsets.fromLTRB(40, 20, 0, 10);
          topSpacing = 40;

        // Large screen
        } else if (screenHeight > LARGE_SCREEN) {
          headerText = Text("Welcome! 🥳", textAlign: TextAlign.left, style: MAIN_HEADING_LARGE_STYLE);
          mainBodyText = bodyTextLarge;
          nextPageButton = NextPageButton.init(context, EventDescr(), 40.0, 15.0);
          mainPadding = EdgeInsets.fromLTRB(40, 80, 0, 10);
          topSpacing = 80;

          // Medium screen
        } else {
          headerText = Text("Welcome! 🥳", textAlign: TextAlign.left, style: MAIN_HEADING_STYLE);
          mainBodyText = bodyText;
          nextPageButton = NextPageButton.init(context, EventDescr(), 30.0, 10.0);
          mainPadding = EdgeInsets.fromLTRB(40, 60, 0, 10);
          topSpacing = 60;
        }

        return Container(
          // 100$ of screen height
            height: double.infinity,
            // 100% of screen width
            width: double.infinity,

            child: Column(

              children: <Widget>[
                SizedBox(height: topSpacing,),
                // Title Text
                Padding(
                  padding: mainPadding,
                  child:
                  Align(
                      alignment: Alignment.topLeft,
                      child: headerText
                      )
                  ),
                // Body Text
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: mainBodyText
                ),
                SizedBox(height: 30),
                // Circular Next Button

                // Next Screen Button
                Expanded(child: nextPageButton)
              ],
            )
        );
      }
    );
  }
}

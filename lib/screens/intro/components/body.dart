import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // 100$ of screen height
        height: double.infinity,
        // 100% of screen width
        width: double.infinity,

        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: topPadding),
            ),
            Text("Title Text", style: Theme.of(context)
                .textTheme
                .headline3
            ),
            SizedBox(height: 30),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: topPadding),
              child: Text(
                  "We empower you to invest in your dream future 🏖" +
                      "\n\nGet \$\$\$ compound earnings from crypto-investments instead of having your money sit in a bank account doing nothing 🏦" +
                      "\n\nWe are starting a movement, a revolution to pool our resources to get our share in crypto-markets where none of us can compete alone 💎" +
                      "\n\nWith your \$SavvyCoins, join events investing in everything from luxury Virtual Real-Estate to the hottest NFT’s ✨" +
                      "\n\nAnd after the event ends, you get your \$returns straight into your personal fund 💳" +
                      "\n\nEven better, we plan on officially listing our \$SavvyCoins for you to get MORE value 💵" +
                      "\n\nGet Rich, Get \$Savvy 🚀 ",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
              ),
            ),

            SizedBox(height: 30),
            ElevatedButton(onPressed: () => print("Text"), child: Text("--> SVG"))
          ],
        )
      );
  }
}

///
/// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: topPadding),
//             ),
//             Text("Title Text", style: Theme.of(context)
//                 .textTheme
//                 .headline3
//             ),
//             Text("TEST TEXT", style: Theme.of(context)
//                 .textTheme
//                 .headline5,
//             ),
//           ElevatedButton(onPressed: () => print("Text"), child: Text("--> SVG"))
//           ],
//         ),
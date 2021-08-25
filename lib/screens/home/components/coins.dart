import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

class Coins extends StatefulWidget {
  //const Coins({ Key? key }) : super(key: key);

  @override
  _CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  double coins = 0;
  double dollars = 0;

  @override
  Widget build(BuildContext context) {
    Widget coinsTitle = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "💰Your Savvy Coins",
            )));

    Widget coinsBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
            Align(alignment: Alignment.topLeft, child: Text(coins.toString())));

    Widget dollarsBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text("= \$" + dollars.toString())));

    return Padding(
        padding: EdgeInsets.fromLTRB(sidePadding, 15, sidePadding, 5),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(containerRoundness))),
            child: Column(
                children: <Widget>[coinsTitle, coinsBody, dollarsBody])));
  }
}

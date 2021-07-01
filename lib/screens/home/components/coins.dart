import 'package:flutter/material.dart';

class Coins extends StatefulWidget {
  //const Coins({ Key? key }) : super(key: key);

  @override
  _CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {
  double coins = 0;
  String coin_name = "SavyCoins";

  @override
  Widget build(BuildContext context) {
    return Text(coin_name + ": " + coins.toString());
  }
}

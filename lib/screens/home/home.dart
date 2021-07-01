import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/home/components/menu.dart';
import 'package:cryptoapp/screens/home/components/coins.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu(),
      body: Column(
        children: <Widget>[Coins()],
      ),
    );
  }
}

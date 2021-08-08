import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';
//import 'package:cryptoapp/screens/home/components/menu.dart';
import 'package:cryptoapp/screens/home/components/home_body.dart';
import 'package:cryptoapp/theme/constants.dart';

// Main home class
class HomeScreen extends StatelessWidget {

  Map userData;
  HomeScreen(this.userData);

  @override
  Widget build(BuildContext context) {
    Widget menuIcons = Container(
      child: Row(
        children: [
          Padding(
              padding:
                  EdgeInsets.fromLTRB(sidePadding, 0, betweenContainers, 5),
              child: Icon(Icons.send, color: Colors.grey, size: 25)),
          Padding(
              padding: EdgeInsets.fromLTRB(
                  betweenContainers, 0, betweenContainers, 5),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.grey,
                size: 25,
              )),
          Padding(
              padding:
                  EdgeInsets.fromLTRB(betweenContainers, 0, sidePadding, 5),
              child: Icon(
                Icons.settings_outlined,
                color: Colors.grey,
                size: 25,
              ))
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopAppBar().getAppBar("Dashboard", true, false, context),
      body: HomeBody(),
    );
  }
}

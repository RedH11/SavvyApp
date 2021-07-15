import 'package:flutter/material.dart';
//import 'package:cryptoapp/screens/home/components/menu.dart';
import 'package:cryptoapp/screens/home/components/home_body.dart';
import 'package:cryptoapp/theme/constants.dart';

// Main home class
class HomeScreen extends StatelessWidget {
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
      appBar: AppBar(
        title: Text("Dashboard",
            style: TextStyle(color: Colors.black, fontSize: 23)),
        actions: [menuIcons],
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        titleSpacing: 30,
        shadowColor: Colors.white, // can turn shadow on or off
      ),
      body: HomeBody(),
    );
  }
}

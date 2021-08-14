import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:cryptoapp/screens/widgets/notifications_display.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ///
    /// Firebase get info:
    /// Does the user have invites
    /// What notifications they have
    ///
    int invAmount = 1;

    var notificationsDisplay = NotificationsDisplay();
    var notifBody = notificationsDisplay.getNotifications(invAmount);

    // App bar variables
    bool hasNotification = false;
    bool useMenuIcons = false;
    bool useBackButton = true;

    return Scaffold(
      appBar: TopAppBar().getAppBar("Activity", useMenuIcons, useBackButton, hasNotification, context),
      body: Container(
        color: backgroundColor,
        child: Column(children: <Widget>[notifBody],)
      )
    );
  }

}
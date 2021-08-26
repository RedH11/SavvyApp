import 'package:cryptoapp/theme/settings.dart';
import 'package:cryptoapp/widgets/app_bar.dart';
import 'package:cryptoapp/widgets/notifications_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';

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
        color: BACKGROUND_COLOR,
        child: Column(children: <Widget>[notifBody],)
      )
    );
  }

}
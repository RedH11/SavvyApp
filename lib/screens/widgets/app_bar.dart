import 'package:cryptoapp/screens/notifications/notifications.dart';
import 'package:cryptoapp/screens/settings/settings.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
///
/// NEED TO HAVE THE APP BAR NAVIGATE TO THE RIGHT SCREENS
///
///
class TopAppBar {

  AppBar getAppBar(titleText, useMenuIcons, useBackButton, hasNotification, context) {

    Widget notificationIcon;
    Widget notificationButton = IconButton(
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()))
        },
        icon: Icon(
          Icons.notifications_outlined,
          color: APP_BAR_ITEM_COLOR,
          size: 22,
        ));

    if (hasNotification) {
      notificationIcon = Stack(
        children: <Widget>[
          notificationButton,
          new Positioned(
            right: 11,
            top: 10,
            //bottom: 10,
            child: new Container(
              width: 8,
              height: 8,
              padding: EdgeInsets.all(1),
              decoration: new BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
            ),)],);
    } else {
      notificationIcon = notificationButton;
    }

    Widget menuIcons = Container(
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0, 10, 5),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
                  ),
                  child: notificationIcon
              )),
          Padding(
              padding:
              EdgeInsets.fromLTRB(5, 0, 20, 5),
              child: Container(
                height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(containerRoundness))
                  ),
                  child: IconButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()))
                    },
                    icon: Icon(
                      Icons.settings_outlined,
                      color: APP_BAR_ITEM_COLOR,
                      size: 22,
                  ))))
        ],
      ),
    );

    Widget screenMenuIcons = Container();
    Widget backIcon = Container();

    if (useMenuIcons) {
      screenMenuIcons = menuIcons;
    }

    if (useBackButton) {
      backIcon = Padding(
            padding:
            EdgeInsets.fromLTRB(10, 22, 12, 22),
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: IconButton(
                onPressed: () => {
                  Navigator.pop(context)
                },
                icon: Icon(Icons.arrow_back_ios, color: primaryTextColor, size: 22))),
      );
    }

    return AppBar(
      centerTitle: true,
      title: Text(titleText,
          style: APP_BAR_TEXT_STYLE),
      leading: backIcon,
      actions: [screenMenuIcons],
      foregroundColor: Colors.transparent,
      backgroundColor: backgroundColor,
      toolbarHeight: 80,
      titleSpacing: 30,
      shadowColor: Colors.transparent, // can turn shadow on or off
    );
  }
}
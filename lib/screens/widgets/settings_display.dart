import 'package:url_launcher/url_launcher.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsDisplay {

  Padding getDisplay(leftText) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          // Width of the entire container
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: Align(
                alignment: Alignment.centerLeft,
                child: Text(leftText, style: STATS_BODY_STYLE),
              )
              )
            ],
          ),
        )
    );
  }

  // Text on left, link to website on the right
  Padding getLinkDisplay(String title, String url) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Container(
        // Width of the entire container
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: Align(
                alignment: Alignment.centerLeft,
                child: Text(title, style: STATS_BODY_STYLE),
              )),
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                     icon: Icon(Icons.arrow_forward),
                     color: primaryTextColor,
                     iconSize: 25.0,
                     onPressed: () => {
                       if (url.toString().length > 0) {
                        launch(url).catchError((error, stackTrace) {/* handle error */})
                     }
                     },
                   ),
              ),
            ],
          )
      ),
    );
  }

  void setNotifications(bool paused) {
    ///
    /// In firebase user info, toggle the user notifications
    ///
  }


  void triggerLogOut() {
    // Show dialogue to confirm it
    // If yes, log out
  }

  Align getLogOutButton() {
    return Align(
      alignment: Alignment.bottomCenter, child:  Container(
      width: double.infinity,
        height: 40,
        margin: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 0),
        decoration:
        BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: new TextButton(
            onPressed: () => {
              triggerLogOut()
            },
            child: Text("Log Out", style: LOG_OUT_BUTTON_STYLE)
        )
    ),
    );
  }

}
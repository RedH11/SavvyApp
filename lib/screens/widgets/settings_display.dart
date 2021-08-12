import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/constants.dart';

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


  Future<void> triggerLogOut(BuildContext context) async {

    // set up the buttons
      Widget cancelButton = ElevatedButton(
        child: Text("Cancel", style: ALERT_CANCEL_BUTTON_STYLE,),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed:  () {
          // Close the alert
          Navigator.of(context).pop();
        },
      );

      Widget logoutButton = ElevatedButton(
        child: Text("Log Out", style: ALERT_LOGOUT_BUTTON_STYLE,),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed:  () async {
          // Proceed with the sign out
          FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
          await _firebaseAuth.signOut().then((void _) => {
            // Successfully signed out, return to intro page
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IntroScreen()))
          }).catchError((error) => {
            // An error happened.
            print("Error logging out.")
          });
        },
      );

      var alertActions = Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            cancelButton,
            SizedBox(width: 10),// button 1
            logoutButton, // button 2
          ]
      ));

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Are You Sure You Want To Log-Out?"),
        actions: [
          alertActions
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );

  }

  Align getLogOutButton(BuildContext context) {
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
              triggerLogOut(context)
            },
            child: Text("Log Out", style: LOG_OUT_BUTTON_STYLE)
        )
    ),
    );
  }

}
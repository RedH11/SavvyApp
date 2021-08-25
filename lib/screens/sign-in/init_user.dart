import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/screens/prelaunch/prelaunch.dart';
import 'package:cryptoapp/screens/sign-in/username_entry.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class InitUserScreen extends StatelessWidget {

  final String username, phoneNum;
  InitUserScreen(this.username, this.phoneNum);

  final loadingScreen = Scaffold(
      body: Center(
          child: SpinKitThreeBounce(
              color: BUTTON_COLOR,
              size: 50.0
          )
      )
  );

  /// Retrieve the info for all events and about the user (balance, etc.)
  ///
  /// Returns...
  /// String utcOffset:         the hours offset (+/-) from utc for the user's location
  /// String balance:           the current balance of the user associated with the app
  /// int invitesAvailable:     how many invites the user has to send
  /// List<String> userEvents:  a list of the UIDs for events the user is currently participating in
  /// Map<> allEvents:          a dictionary containing the information for all current events

  Future<List> getInfoForHome(String userUID) async {

      // Initialize the instance of the firestore database
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // Get all the event information
      var allEvents = await _firestore.collection('events').get();

      var userInfo = await _firestore.collection('users')
          .where('uid', isEqualTo: userUID)
          .get();

      double balance = 0.0;
      int invitesAvailable = 0;
      List userEvents = [""];

      // Get the user time zone offset
      final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$currentTimeZone'));
      Map data = jsonDecode(response.body);
      // Gets the substring of the hours section to convert to int later
      var utcOffset = int.parse(data['utc_offset'].toString().substring(0, 3));

      return [utcOffset, balance, invitesAvailable, userEvents, allEvents];
  }

  void initializeUser(String username, String phoneNumber, BuildContext context) async {
    AuthenticationService authService = AuthenticationService();
    bool usernameIsTaken = await authService.usernameIsTaken(username);
    String userUID = await authService.getUserUID();

    if (!usernameIsTaken) {
      // Go to the home page after initializing the starting info of the user
      await authService.initializeUser(userUID, username, phoneNumber);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PrelaunchScreen()));
    } else {
      // Go back to the username entry page
      _showErrorDialog("Username Taken", "Please enter another username", phoneNumber, context);
    }
  }

    // user defined function
    void _showErrorDialog(String title, String content, String phoneNumber, BuildContext parentContext) {
      showDialog(
        context: parentContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(title),
            content: new Text(content),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new TextButton(
                child: new Text("Close"),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  // Return to the username entry screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ParentUsernameEntryScreen(phoneNumber)));
                },
              ),
            ],
          );
        },
      );
    }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 1), () async => {
      initializeUser(username, phoneNum, context)
    });

    // Load while the info is retrieved and processed
    return loadingScreen;
  }
}
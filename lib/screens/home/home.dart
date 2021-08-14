import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:cryptoapp/screens/widgets/loading.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/home/components/home_body.dart';
import 'package:cryptoapp/models/event.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

// Main home class
class HomeScreen extends StatelessWidget {

  final String userUID;
  HomeScreen(this.userUID);

  final Scaffold loadingScreen = LoadingWidget().getLoadingScreen();

  /// Retrieve the info for all events and about the user (balance, etc.)
  ///
  /// Returns...
  /// String utcOffset:         the hours offset (+/-) from utc for the user's location
  /// String balance:           the current balance of the user associated with the app
  /// int invitesAvailable:     how many invites the user has to send
  /// List<String> userEvents:  a list of the UIDs for events the user is currently participating in
  /// Map<> allEvents:          a dictionary containing the information for all current events
  Future<List<dynamic>> _getNetworkData() async {

    // Initialize the instance of the firestore database
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Get all the event information
    var allEvents = await _firestore.collection('events').get();

    // Get the user information
    var userInfo = await _firestore.collection('users').doc(userUID).get();
    double balance = userInfo['balance'];
    int invitesAvailable = userInfo['invites_available'];
    List<String> userEvents = userInfo['current_events'];

    // Get the user time zone offset
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$currentTimeZone'));
    Map data = jsonDecode(response.body);
    // Gets the substring of the hours section to convert to int later
    var utcOffset = data['utc_offset'].toString().substring(0, 3);

    return [utcOffset, balance, invitesAvailable, userEvents, allEvents];
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<dynamic>>(
      future: _getNetworkData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("THERE WAS AN ERROR! GOING TO INTRO SCREEN");

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => IntroScreen()));

          return loadingScreen;

        } else if (snapshot.hasData) {

          // Parse the snapshot for the user info
          int utcOffset = snapshot.data?.elementAt(0) as int;
          double balance = snapshot.data?.elementAt(1);
          int invitesAvailable = snapshot.data?.elementAt(2);
          List<String> userEvents = snapshot.data?.elementAt(3);
          var allEvents = snapshot.data?.elementAt(4);

          // Variables for the app bar
          //  Show a notification if there is an invite available
          bool hasNotification = true; //invitesAvailable > 0;
          bool useMenuIcons = true;
          bool useBackButton = false;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: TopAppBar().getAppBar("Dashboard", useMenuIcons, useBackButton, hasNotification, context),
            body: HomeBody(userEvents, allEvents, utcOffset),
          );
        } else {
          return loadingScreen;
        }
      }
    );
  }
}

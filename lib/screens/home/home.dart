import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:cryptoapp/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/home/components/home_body.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:http/http.dart';

// Main home class
class HomeScreen extends StatelessWidget {

  final String userUID;
  HomeScreen(this.userUID);

  final Scaffold loadingScreen = LoadingWidget().getLoadingScreen();

  Future<List<dynamic>> _getUserInfo() async {
    // Initialize the instance of the firestore database
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Get all the event information
    QuerySnapshot allEvents = await _firestore.collection('events').orderBy('startTime', descending: false).get();

    var userInfo = await _firestore.collection('users')
        .where('uid', isEqualTo: userUID)
        .get();

    var userData = userInfo.docs.first.data();

    double balance = userData['balance'];
    int invitesAvailable = userData['invites_available'];
    List userEvents = userData['current_events'];

    // Get the user time zone offset
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$currentTimeZone'));
    Map data = jsonDecode(response.body);
    // Gets the substring of the hours section to convert to int later
    var utcOffset = int.parse(data['utc_offset'].toString().substring(0, 3));

    return <dynamic>[utcOffset, balance, invitesAvailable, userEvents, allEvents];
  }

  Scaffold _buildHomePage(var snapshot, BuildContext context) {
    // Parse the snapshot for the user info
    int utcOffset = snapshot.elementAt(0);
    double balance = snapshot.elementAt(1);
    int invitesAvailable = snapshot.elementAt(2);
    List<dynamic> userEvents = snapshot.elementAt(3);
    var allEvents = snapshot.elementAt(4);

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
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<dynamic>>(
        future: _getUserInfo(),
    builder: (context, snapshot) {

      if (snapshot.hasError) {
        print("error in home snapshot");
        return loadingScreen;

      } else if (snapshot.hasData) {
        return _buildHomePage(snapshot.data, context);

      } else {
        return loadingScreen;
      }
    }
    );
  }
}

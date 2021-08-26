import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/screens/prelaunch/prelaunch.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/theme/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';
class StartupScreen extends StatelessWidget {

  static const loadingScreen = Scaffold(
      body: Center(
          child: SpinKitThreeBounce(
              color: BUTTON_COLOR,
              size: 50.0
          )
      )
  );

  Future<List<dynamic>> _getUserInformation() async {
    var authService = AuthenticationService();

    // If the user is logged in, return that they are and their UID
    if (await authService.isUserLoggedIn()) {
      String userUID = await authService.getUserUID();
      return [true, userUID];
      // If the user is not logged in, process their phone verification
    } else {
      return [false, ""];
    }
  }

  Future<bool> _userAcccountComplete(String userUID) async {

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      var userInfo = await _firestore.collection('users')
          .where('uid', isEqualTo: userUID).get();

      return userInfo.docs.first.exists;

    } catch (e) {
      return false;
    }
  }

  ///
  /// METHOD USED FOR TESTING
  ///
  Future<void> _signOutToIntro(BuildContext context) async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FirstScreen()));
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 0), () async {
      var userInfo = await _getUserInformation();

        bool userLoggedIn = userInfo[0];
        String userUID = userInfo[1].toString();

        bool userAccountComplete = await _userAcccountComplete(userUID);

        if (userLoggedIn == true) {

          // If the user has no information, the user didn't complete the login
          // Log them out of the current stasis account and send them back to intro
          if (!userAccountComplete) {
            _signOutToIntro(context);
          // User is logged in and has completed account creation, go to home
          } else {
            print("User is logged in, sending them to the home screen...");
            // User is logged in, load their data
            Navigator.push(context, MaterialPageRoute(builder: (context) => PrelaunchScreen()));
          }
        } else {
          print("User is NOT logged in, sending them to the intro screen...");
          // User is NOT logged in, go to login screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()));
        }
    });

    return loadingScreen;
  }
}


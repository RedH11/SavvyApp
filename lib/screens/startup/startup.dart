import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Check whether or not the user is logged in with FirebaseAuth
  bool isUserLoggedIn() {
    var user = _firebaseAuth.currentUser!;
    return user != null;
  }

  // If the user is logged in, retrieve their information from the FireStore
  Map getUserInformation() {
    var user = _firebaseAuth.currentUser!;
    var uid = user.uid;

    ///
    /// Retrieve the user's information from FireStore
    ///

    return {};  // Empty dictionary returned for now
  }
}

class StartupScreen extends StatelessWidget {

  Map userData = {};

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
            child: SpinKitThreeBounce(
                color: BUTTON_COLOR,
                size: 50.0
            )
        )
    );
  }

  Future<void>getUserInformation(context) async {

    var authService = AuthenticationService();

    if (authService.isUserLoggedIn()) {
      // User is logged in, load their data
      ///
      /// Fill this.userData with the necessary data
      ///
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen(this.userData)));
    } else {
      // User is NOT logged in, go to login screen
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => IntroScreen()));
    }
  }
}
import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/screens/settings/settings.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      return [true, authService.getUserUID()];
      // If the user is not logged in, process their phone verification
    } else {
      return [false, ""];
    }
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 0), () async {
      var userInfo = await _getUserInformation();

        bool userLoggedIn = userInfo[0];
        String userUID = userInfo[1].toString();

        if (userLoggedIn == true) {
          //print("User is logged in, sending them to the home screen...");
          // User is logged in, load their data
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(userUID)));
        } else {
          //print("User is NOT logged in, sending them to the intro screen...");
          // User is NOT logged in, go to login screen
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        }
    });

    return loadingScreen;
  }
}


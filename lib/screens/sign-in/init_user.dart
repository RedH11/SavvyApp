import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/sign-in/username_entry.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  void initializeUser(String username, String phoneNumber, BuildContext context) async {
    AuthenticationService authService = AuthenticationService();
    bool usernameIsTaken = await authService.usernameIsTaken(username);
    String userUID = await authService.getUserUID();
    print(" IN INIT USER IT IS SHOWN AS $usernameIsTaken for user is taken");
    if (!usernameIsTaken) {
      // Go to the home page
      await authService.initializeUser(username, phoneNumber);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen(userUID)));
    } else {
      // Go back to the username entry page
      _showErrorDialog("Username Taken", "Please enter another username", phoneNumber, context);
    }
  }

    // user defined function
    void _showErrorDialog(String title, String content, String phoneNumber, BuildContext parentContext) {
      // flutter defined function
      showDialog(
        context: parentContext,
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptoapp/screens/prelaunch/prelaunch.dart';
import 'package:cryptoapp/screens/sign-in/username_entry.dart';
import 'package:cryptoapp/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckExistingUserScreen extends StatelessWidget {

  final String phoneNumber;
  CheckExistingUserScreen(this.phoneNumber);

  final loadingScreen = LoadingWidget().getLoadingScreen();
  final _firestore = FirebaseFirestore.instance;

  void _goToUsernameScreen(context) {
    print(
        "NO user exists with this phone number, going to username screen");
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => ParentUsernameEntryScreen(phoneNumber)));
  }

  // Checks if the phone number is registered to an existing user
  Future<void> _checkPhoneNumberRegistration(context) async {

    try {
      var userWithThisPhone = await _firestore.collection('users')
          .where('phone_number', isEqualTo: phoneNumber)
          .get();

      if (userWithThisPhone.docs.first.exists) {
        print("User exists with this phone number, going to home screen");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PrelaunchScreen()));
      } else {
        _goToUsernameScreen(context);
      }
    } catch (e) {
      _goToUsernameScreen(context);

    }
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 0), () async => {
      _checkPhoneNumberRegistration(context)
    });

    return loadingScreen;
  }

}
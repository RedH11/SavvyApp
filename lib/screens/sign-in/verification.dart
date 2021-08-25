import 'package:flutter/material.dart';

import 'components/verification_body.dart';


class ParentVerificationScreen extends StatelessWidget {

  String userPhoneNumber;
  ParentVerificationScreen(this.userPhoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationScreen(this.userPhoneNumber),
    );
  }
}


class VerificationScreen extends StatefulWidget {

  String userPhoneNumber;
  VerificationScreen(this.userPhoneNumber);

  @override
  VerificationBody createState() => VerificationBody(this.userPhoneNumber);
}

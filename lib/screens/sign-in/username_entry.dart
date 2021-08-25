import 'package:flutter/material.dart';

import 'components/username_body.dart';

class ParentUsernameEntryScreen extends StatelessWidget {

  final String phoneNumber;
  ParentUsernameEntryScreen(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UsernameEntryScreen(phoneNumber),
    );
  }
}

class UsernameEntryScreen extends StatefulWidget {

  final String phoneNumber;
  UsernameEntryScreen(this.phoneNumber);

  @override
  UsernameEntryBody createState() => UsernameEntryBody(phoneNumber);
}
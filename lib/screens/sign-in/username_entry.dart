import 'package:flutter/material.dart';
import 'components/get_phone_num_body.dart';
import 'components/username_body.dart';

class ParentUsernameEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UsernameEntryScreen(),
    );
  }
}

class UsernameEntryScreen extends StatefulWidget {
  @override
  UsernameEntryBody createState() => UsernameEntryBody();
}
import 'package:flutter/material.dart';

import 'components/get_phone_num_body.dart';


class ParentPhoneNumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetPhoneNumScreen(),
    );
  }
}


class GetPhoneNumScreen extends StatefulWidget {
  @override
  GetPhoneNumBody createState() => GetPhoneNumBody();
}
import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:flutter/material.dart';
import 'UI_Widgets.dart';

class VerificationBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    WidgetGenerator widgetGen = WidgetGenerator();

    return Container(
      color: Colors.white,
      // 100$ of screen height
      height: double.infinity,
      // 100% of screen width
      width: double.infinity,

      child: Column(
          children: <Widget>[
            Column(
                children: <Widget>[
                  SizedBox(height: 100,),
                  widgetGen.getTitle("Please enter the verification code"),
                  SizedBox(height: 40,),
                  ///
                  /// Going to need to add phone number verification
                  ///
                  widgetGen.getPinCodeTextField(context),
                  SizedBox(height: 60,),
                  widgetGen.getNextPageButton(context, GetPhoneNumScreen())
                ]
            ),
            ///
            /// HAVE THE SIGN IN BUTTON BE GREY UNTIL TEXT IS PUT IN AND IN THE MIDDLE OF THE SCREEN
            ///
          ]
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../verification.dart';
import 'UI_Widgets.dart';

class GetPhoneNumBody extends StatelessWidget {
  
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
          SizedBox(height: 100,),
          widgetGen.getTitle("Enter your phone #"),
          widgetGen.getSubTitle("You can get an invite from any current user 📬"),
          SizedBox(height: 20,),
          ///
          /// Going to need to add phone number verification
          ///
          widgetGen.getPhoneTextField("Phone #", TextInputType.number),
          SizedBox(height: 60,),
          ///
          /// HAVE THE BUTTON BE GREY UNTIL TEXT IS PUT IN AND IN THE MIDDLE OF THE SCREEN
          ///
          widgetGen.getNextPageButton(context, SignInScreen())
        ]
      ),
    );
  }
}
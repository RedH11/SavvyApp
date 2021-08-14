import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/sign-in/init_user.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../username_entry.dart';
import 'UI_Widgets.dart';

class UsernameEntryBody extends State<UsernameEntryScreen> {

  final String phoneNumber;
  UsernameEntryBody(this.phoneNumber);

  bool _enabled = false;
  String username = "";

  @override
  Widget build(BuildContext context) {

    var widgetGen = WidgetGenerator();

    var usernameInput = Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  children: <Widget>[
                    Text("@", style: TEXT_FIELD_INPUT_STYLE,),
                    SizedBox(width: 2,),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$'))
                        ],
                        enableSuggestions: false,
                        style: TEXT_FIELD_INPUT_STYLE,
                        autocorrect: false,
                        cursorColor: primaryTextColor,
                        decoration: InputDecoration(
                          border: InputBorder.none
                          ),
                        onChanged: (value) => {
                          setState(() {
                            _enabled = value.length > 0;
                            username = value;
                          })
                        },
                      ),
                    ),
                 ],
            )
          )
        )
      )
    );

    var currentColor = _enabled ? BUTTON_COLOR : FADED_BUTTON_COLOR;

    var nextPageButton = Align(
      alignment: Alignment.bottomCenter, child:  SizedBox(
        width: 280,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(currentColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.transparent)
                  )
              ),
          ),
            onPressed: () => {
            if (_enabled) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InitUserScreen(username, phoneNumber)))
            }
        },
            child: Text("Next", style: FINAL_NEXT_PAGE_BUTTON_STYLE)
        )
    ),
    );

    return Container(
      // white background
      color: Colors.white,
      // 100% of screen height
      height: double.infinity,
      // 100% of screen width
      width: double.infinity,

      child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            widgetGen.getTitle("Let's setup your username!"),
            SizedBox(height: 20,),
            usernameInput,
            SizedBox(height: 60,),
            nextPageButton
          ]
      ),
    );
  }
}
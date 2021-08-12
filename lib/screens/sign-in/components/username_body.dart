import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../username_entry.dart';
import 'UI_Widgets.dart';

class UsernameEntryBody extends State<UsernameEntryScreen> {

  bool isUsernameEntered = false;


  ///
  /// next step is to finish the functionality to get the user info set up with the username and the default values
  /// for everything else
  ///

  ///
  /// Need to add a username is taken text to pop up after submit
  ///

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
                            isUsernameEntered = value.length > 0;
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

    // Next page button to go to the home screen with no information for a new user
    ///
    /// Verify the username is not already used and then send the user to the home page
    ///
    var nextPageButton = widgetGen.getNextPageButton(context, HomeScreen(""), isUsernameEntered);

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
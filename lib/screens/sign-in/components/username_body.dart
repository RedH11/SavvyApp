import 'package:cryptoapp/screens/sign-in/init_user.dart';
import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/theme/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';
import '../username_entry.dart';
import 'UI_Widgets.dart';

class UsernameEntryBody extends State<UsernameEntryScreen> {
  final String phoneNumber;

  UsernameEntryBody(this.phoneNumber);

  bool _enabled = false;
  String username = "";

  Widget _getUsernameInput() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: <Widget>[
                Text(
                  "@",
                  style: TEXT_FIELD_INPUT_STYLE,
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  width: 180,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[a-zA-Z0-9]+$'))
                    ],
                    enableSuggestions: false,
                    style: TEXT_FIELD_INPUT_STYLE,
                    autocorrect: false,
                    cursorColor: PRIMARY_TEXT_COLOR,
                    decoration: InputDecoration(border: InputBorder.none),
                    onChanged: (value) => {
                      setState(() {
                        _enabled = value.length > 0;
                        username = value;
                      })
                    },
                  ),
                ),
              ],
            )));
  }

  Widget _getNextPageButton(height, style) {
    var currentColor = _enabled ? BUTTON_COLOR : FADED_BUTTON_COLOR;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: double.infinity,
          height: height,
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(currentColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.transparent))),
              ),
              onPressed: () => {
                    if (_enabled)
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InitUserScreen(username, phoneNumber)))
                      }
                  },
              child: Text("Next", style: style))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgetGen = WidgetGenerator();

    return DynamicWidgetBuilder(builder: (context, sizingInformation) {
      Widget nextPageButton;
      TextStyle titleTextStyle;
      TextStyle nextPageButtonStyle;
      double nextPageButtonHeight;
      double topSpacing;

      double screenHeight = sizingInformation.screenSize.height;

      // Small screen
      if (screenHeight < SMALL_SCREEN) {
        titleTextStyle = INTRO_TITLE_SMALL_STYLE;
        nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_SMALL_STYLE;
        nextPageButtonHeight = 40;
        topSpacing = 60;

        // Large screen
      } else if (screenHeight > LARGE_SCREEN) {
        titleTextStyle = INTRO_TITLE_LARGE_STYLE;
        nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_LARGE_STYLE;
        nextPageButtonHeight = 60;
        topSpacing = 100;
        // Medium screen
      } else {
        titleTextStyle = INTRO_TITLE_STYLE;
        nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_STYLE;
        nextPageButtonHeight = 50;
        topSpacing = 80;
      }

      return Container(
        // white background
        color: Colors.white,
        // 100% of screen height
        height: double.infinity,
        // 100% of screen width
        width: double.infinity,

        child: Column(children: <Widget>[
          SizedBox(
            height: topSpacing,
          ),
          widgetGen.getTitleTopCenter(
              "Let's setup your username!", titleTextStyle),
          SizedBox(
            height: 20,
          ),
          _getUsernameInput(),
          SizedBox(
            height: 60,
          ),
          _getNextPageButton(nextPageButtonHeight, nextPageButtonStyle)
        ]),
      );
    });
  }
}

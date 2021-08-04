import 'package:flutter/cupertino.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class WidgetGenerator {

  Padding getTitle(String title) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(title, style: INTRO_TITLE_STYLE, textAlign: TextAlign.center,),
        )
    );
  }

  Padding getSubTitle(String title) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(title, style: mainBodyStyle, textAlign: TextAlign.center),
        )
    );
  }

  Padding getPinCodeTextField(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: PinCodeTextField(
            length: 5,
            onChanged: (value) {
              print(value);
            },
            appContext: context,
            cursorColor: BUTTON_COLOR,
            pinTheme: PinTheme(
              inactiveColor: primaryTextColor,
              fieldHeight: 50,
              fieldWidth: 40,
            ),
          )
      )
    );
  }

  Align getBackButton(BuildContext context, nextScreen) {

    Color currentColor = primaryTextColor;

    return Align(
      alignment: Alignment.topLeft, child:  Container(
        margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
        child: TextButton.icon(
                  onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => nextScreen));
                },
                label: Text("Enter a New Phone", style: mainBodyStyle,),
                icon: Icon(Icons.arrow_back_ios, color: currentColor, size: 20,),
              ),
    ),
    );
  }

    Align getNextPageButton(BuildContext context, nextScreen, bool isEnabled) {

        var currentColor = BUTTON_COLOR;

        if (isEnabled == false) {
          currentColor = FADED_BUTTON_COLOR;
        }

        return Align(
        alignment: Alignment.bottomCenter, child:  Container(
          width: 280,
          height: 50,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration:
          BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: new TextButton(
              onPressed: () {
                if (isEnabled) {
                  // Go to next page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nextScreen));
                } else {
                  // Do nothing
                  null;
                }
              }
              ,
              child: Text("Next", style: FINAL_NEXT_PAGE_BUTTON_STYLE)
          )
      ),
      );
    }

      Align getBottomGreyContainer() {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(height: 80, color: backgroundColor,)
        );
      }
}
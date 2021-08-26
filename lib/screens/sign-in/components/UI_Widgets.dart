import 'package:cryptoapp/theme/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';

class WidgetGenerator {

  Padding getTitleTopCenter(String title, style) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(title, style: style, textAlign: TextAlign.center,),
        )
    );
  }

  Padding getTitleCenter(String title, style) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.center,
          child: Text(title, style: style, textAlign: TextAlign.center,),
        )
    );
  }



  Padding getSubTitle(String title, style) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(title, style: style, textAlign: TextAlign.left),
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
              inactiveColor: PRIMARY_TEXT_COLOR,
              fieldHeight: 50,
              fieldWidth: 40,
            ),
          )
      )
    );
  }

  Align getBackButton(BuildContext context, nextScreen) {

    Color currentColor = PRIMARY_TEXT_COLOR;

    return Align(
      alignment: Alignment.topLeft, child:  Container(
        margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
        child: TextButton.icon(
                  onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => nextScreen));
                },
                label: Text("Enter a New Phone", style: MAIN_BODY_STYLE,),
                icon: Icon(Icons.arrow_back_ios, color: currentColor, size: 20,),
              ),
    ),
    );
  }

    Align getNextPageButton(BuildContext context, nextScreen, bool isEnabled, double _height, TextStyle style) {

        var currentColor = BUTTON_COLOR;

        if (isEnabled == false) {
          currentColor = FADED_BUTTON_COLOR;
        }

        return Align(
        alignment: Alignment.bottomCenter, child:  Container(
          width: double.infinity,
          height: _height,
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration:
          BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: new TextButton(
              onPressed: () {
                if (isEnabled) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nextScreen));
                } else {
                  // Do nothing
                  null;
                }
              }
              ,
              child: Text("Next", style: style)
          )
      ),
      );
    }

      Align getBottomGreyContainer() {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(height: 80, color: BACKGROUND_COLOR,)
        );
      }
}
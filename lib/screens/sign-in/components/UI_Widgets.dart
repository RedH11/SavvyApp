import 'package:cryptoapp/screens/sign-in/components/phone_num_input_formatter.dart';
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

  // NOT CURRENTLY IN USE
  Padding getPhoneTextField(String backgroundText, TextInputType textInputType) {
    final _mobileFormatter = NumberTextInputFormatter();

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
          alignment: Alignment.topLeft,
          child: TextField(
            keyboardType: textInputType,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              _mobileFormatter,
              ],
            obscureText: false,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: TEXT_FIELD_COLOR),
              ),
              labelText: backgroundText,
              labelStyle: TEXT_FIELD_LABEL_STYLE,
              focusColor: buttonColor
            ),
          ),
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
            cursorColor: buttonColor,
            pinTheme: PinTheme(
              inactiveColor: primaryTextColor,
              fieldHeight: 50,
              fieldWidth: 40,
            ),
          )
      )
    );
  }

    Align getNextPageButton(BuildContext context, nextScreen) {
      return Align(
        alignment: Alignment.bottomCenter, child:  Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.fromLTRB(0, 0, sidePadding, 0),
          decoration:
          BoxDecoration(
              color: primaryButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: new TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => nextScreen)),
              child: Text("Next", style: finalNextPageButtonStyle)
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
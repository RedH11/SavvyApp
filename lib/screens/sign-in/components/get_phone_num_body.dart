import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../get_phone_num.dart';
import '../verification.dart';
import 'UI_Widgets.dart';

///
///
/// SCALE THE NEXT BUTTON FOR THE LARGE PHONE
/// AND THE INPUT TEXTFIELD
///

class GetPhoneNumBody extends State<GetPhoneNumScreen> {

  // Global isPhoneEntered variable to help decide the button color
  bool isPhoneEntered = false;
  var initialCountry = PhoneNumber(isoCode: 'GB');
  var userPhoneNumber = "";
  // Initializing variables for the country selection
  final TextEditingController controller = TextEditingController();

  Widget _getPhoneInput(textStyle) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Align(
            alignment: Alignment.centerLeft,
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                setState(() {
                  initialCountry = PhoneNumber(isoCode: number.isoCode);
                  userPhoneNumber = number.phoneNumber!;
                });},
              onInputValidated: (bool value) {
                setState(() {
                  isPhoneEntered = value;
                });
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: primaryTextColor),
              initialValue: initialCountry,
              countries: ['US', 'GB'],
              maxLength: 10,
              textFieldController: controller,
              formatInput: false,
              inputDecoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: TEXT_FIELD_COLOR),
                  )
              ),
              keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: TEXT_FIELD_COLOR),
              ),
              textStyle: textStyle,
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    // Initializing Widget Builder and the next page button
    WidgetGenerator widgetGen = WidgetGenerator();

    return DynamicWidgetBuilder(
        builder: (context, sizingInformation) {

      Widget nextPageButton;
      TextStyle titleTextStyle;
      TextStyle phoneInputTextStyle;
      TextStyle tosTextStyle;
      TextStyle nextPageButtonStyle;
      double nextPageButtonHeight;
      double topSpacing;

      double screenHeight = sizingInformation.screenSize.height;

      // Small screen
      if (screenHeight < SMALL_SCREEN) {
        titleTextStyle = INTRO_TITLE_SMALL_STYLE;
        phoneInputTextStyle = MAIN_BODY_SMALL_STYLE;
        tosTextStyle = TOS_SMALL_STYLE;
        nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_SMALL_STYLE;
        nextPageButtonHeight = 40;
        topSpacing = 60;

      // Large screen
      } else if (screenHeight > LARGE_SCREEN) {
        titleTextStyle = INTRO_TITLE_LARGE_STYLE;
        phoneInputTextStyle = MAIN_BODY_LARGE_STYLE;
        tosTextStyle = TOS_LARGE_STYLE;
        nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_LARGE_STYLE;
        nextPageButtonHeight = 60;
        topSpacing = 100;

        // Medium screen
      } else {
        titleTextStyle = INTRO_TITLE_STYLE;
        phoneInputTextStyle = MAIN_BODY_STYLE;
        tosTextStyle = TOS_STYLE;
        nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_STYLE;
        nextPageButtonHeight = 50;
        topSpacing = 80;

      }

      nextPageButton = widgetGen.getNextPageButton(context, ParentVerificationScreen(this.userPhoneNumber), isPhoneEntered, nextPageButtonHeight, nextPageButtonStyle);
      var phoneInput = _getPhoneInput(phoneInputTextStyle);

    return Container(
      color: Colors.white,
      // 100$ of screen height
      height: double.infinity,
      // 100% of screen width
      width: double.infinity,

      child: Column(
        children: <Widget>[
          SizedBox(height: topSpacing),
          widgetGen.getTitleCenter("Enter your phone #", titleTextStyle),
          SizedBox(height: 20,),
          phoneInput,
          SizedBox(height: 80,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("By entering your phone number you're"
                  " agreeing to our Terms of Service and Privacy Policy. Thanks!"
                  "\n(savvyapp.com/tos)"
                , style: tosTextStyle, textAlign: TextAlign.center,)),
          SizedBox(height: 20,),
          nextPageButton,
        ]
      ),
    );});
  }
}
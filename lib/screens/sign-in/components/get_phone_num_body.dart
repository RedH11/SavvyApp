import 'package:cryptoapp/screens/sign-in/username_entry.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../get_phone_num.dart';
import '../verification.dart';
import 'UI_Widgets.dart';

class GetPhoneNumBody extends State<GetPhoneNumScreen> {

  // Global isPhoneEntered variable to help decide the button color
  bool isPhoneEntered = false;
  var initialCountry = PhoneNumber(isoCode: 'GB');
  var userPhoneNumber = "";

  @override
  Widget build(BuildContext context) {

    // Initializing Widget Builder and the next page button
    WidgetGenerator widgetGen = WidgetGenerator();
    var nextPageButton = widgetGen.getNextPageButton(context, ParentVerificationScreen(this.userPhoneNumber), isPhoneEntered);

    // Initializing variables for the country selection
    final TextEditingController controller = TextEditingController();

    var phoneInput = Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
            alignment: Alignment.topLeft,
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
        )
      )
    );


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
          phoneInput,
          SizedBox(height: 20,),
          SizedBox(height: 60,),
          nextPageButton,
          Padding(
              padding: EdgeInsets.fromLTRB(40, 100, 40, 0),
              child: Text("By signing up with your phone number you are"
                  " agreeing to the Terms of Service that can be found on "
                  "savvyapp.com/tos"
                , style: mainBodyStyle, textAlign: TextAlign.center,))
        ]
      ),
    );
  }
}
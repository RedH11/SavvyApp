import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../username_entry.dart';
import '../verification.dart';
import 'UI_Widgets.dart';

///
/// Need some kind of buffer logic between the verification completion and the account to pull the info
/// And if it doesn't exist to set default info for a new user
///
///
/// Also need to add some responsive UI to keep the user informed that the code
/// was sent successfully (making it pause while the code is being sent) 
///

class VerificationBody extends State<VerificationScreen> {

  String userPhoneNumber;
  VerificationBody(this.userPhoneNumber);

  var verificationCodeEntered = false;
  var verificationCode = "";
  var resendCode = 0;
  var isLoading = true;
  var isVerified = false;
  var userUID = "";

  static const loadingScreen = Scaffold(
      body: Center(
          child: SpinKitThreeBounce(
              color: BUTTON_COLOR,
              size: 50.0
          )
      )
  );


  Widget getResendButton() {

    var authService = AuthenticationService();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: TextButton(
          child: Text("Resend Code", style: FINAL_NEXT_PAGE_BUTTON_STYLE,),
          onPressed: () {
            authService.resendAuthCode(userPhoneNumber, resendCode);
          },
        ),
      ),
    );
  }

  Widget getPinCodeTextField() {

    TextEditingController pinCodeController = TextEditingController();

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
            alignment: Alignment.topCenter,
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              controller: pinCodeController,
              length: 5,
              onChanged: (value) => {
                setState(() async {
                  // If a full verification code has been entered
                  if (value.toString().length == 5) {
                    // Authenticate the inputted verification code
                    PhoneAuthProvider.credential(
                        verificationId: verificationCode,
                        smsCode: value
                    );
                  }
                })
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

  Future<bool> _sendAuthCode() async {
    var authService = AuthenticationService();

    var codeWasSent = await authService.loginWithPhone(userPhoneNumber);

    return codeWasSent;
  }

  @override
  Widget build(BuildContext context) {

    // Use future builder here to change UI after the code is verified as sent
    return FutureBuilder(
        future: _sendAuthCode(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return loadingScreen;

          } else if (snapshot.hasData) {

            WidgetGenerator widgetGen = WidgetGenerator();

            var pinCodeTextField = getPinCodeTextField();

            var resendButton = getResendButton();

            return Scaffold(
                body: Container(
              color: Colors.white,
              // 100$ of screen height
              height: double.infinity,
              // 100% of screen width
              width: double.infinity,

              child: Column(
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          widgetGen.getBackButton(context, ParentPhoneNumScreen()),
                          SizedBox(height: 20,),
                          widgetGen.getTitle("Enter the Confirmation Code"),
                          SizedBox(height: 40,),
                          pinCodeTextField,
                          SizedBox(height:10),
                          resendButton,
                          SizedBox(height: 60,),
                          widgetGen.getNextPageButton(context, ParentUsernameEntryScreen(), verificationCodeEntered)
                        ]
                    ),
                  ]
              ),
            ));
          } else {
            return loadingScreen;
          }
        }
    );
  }

}
import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:cryptoapp/screens/startup/authentication_service.dart';
import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/theme/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../check_existing_user.dart';
import '../verification.dart';
import 'UI_Widgets.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';

///
/// Until I get the app code from the app store,
/// The resend code button is disabled and the verification is not used
///

///
///
/// Need some kind of buffer logic between the verification completion and the account to pull the info
/// And if it doesn't exist to set default info for a new user
///
///
/// Also need to add some responsive UI to keep the user informed that the code
/// was sent successfully (making it pause while the code is being sent)
///
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
  var nextButtonIsEnabled = false;
  var pinCodeController = TextEditingController();

  static const loadingScreen = Scaffold(
      body: Center(
          child: SpinKitThreeBounce(
              color: BUTTON_COLOR,
              size: 50.0
          )
      )
  );


  Widget _getResendButton(style) {

    var authService = AuthenticationService();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            child: TextButton(
              child: Text("Didn't receive a code? Tap to resend it", style: style,),
              onPressed: () {
                ///
                /// CURRENTLY DISABLED
                ///
                print("Resend Button Not In Use, verification_body");
                //authService.resendAuthCode(userPhoneNumber, resendCode);
              },
            )),
      ),
    );
  }

  Widget _getPinCodeTextField(height, width) {

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
            alignment: Alignment.topCenter,
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              controller: pinCodeController,
              length: 5,
              onChanged: (value) => {
                // Not doing anything right now, because it would redo the future
                // builder and bug out
              },
              appContext: context,
              cursorColor: BUTTON_COLOR,
              pinTheme: PinTheme(
                inactiveColor: PRIMARY_TEXT_COLOR,
                fieldHeight: height,
                fieldWidth: width,
              ),
            )
        )
    );
  }

  Future<bool> _sendAuthCode() async {
    var authService = AuthenticationService();

    //var codeWasSent = await authService.loginWithPhone(userPhoneNumber);

    var codeWasSent = await authService.getTestUser();

    return codeWasSent;
  }

  // user defined function
  void _showDialog(String title, String content) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _getBody() {
    return DynamicWidgetBuilder(
        builder: (context, sizingInformation) {

          Widget nextPageButton;
          TextStyle titleTextStyle;
          TextStyle nextPageButtonStyle;
          TextStyle resendCodeStyle;
          double nextPageButtonHeight;
          double topSpacing;
          double pinHeight;
          double pinWidth;

          double screenHeight = sizingInformation.screenSize.height;

          // Small screen
          if (screenHeight < SMALL_SCREEN) {
            titleTextStyle = INTRO_TITLE_SMALL_STYLE;
            nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_SMALL_STYLE;
            resendCodeStyle = RESEND_CODE_SMALL_STYLE;
            nextPageButtonHeight = 40;
            topSpacing = 20;
            pinHeight = 40;
            pinWidth = 30;

            // Large screen
          } else if (screenHeight > LARGE_SCREEN) {
            titleTextStyle = INTRO_TITLE_LARGE_STYLE;
            nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_LARGE_STYLE;
            resendCodeStyle = RESEND_CODE_LARGE_STYLE;
            nextPageButtonHeight = 60;
            topSpacing = 40;
            pinHeight = 60;
            pinWidth = 50;

            // Medium screen
          } else {
            titleTextStyle = INTRO_TITLE_STYLE;
            nextPageButtonStyle = FINAL_NEXT_PAGE_BUTTON_STYLE;
            resendCodeStyle = RESEND_CODE_STYLE;
            nextPageButtonHeight = 50;
            topSpacing = 30;
            pinHeight = 50;
            pinWidth = 40;

          }

          WidgetGenerator widgetGen = WidgetGenerator();

          var pinCodeTextField = _getPinCodeTextField(pinHeight, pinWidth);

          var resendButton = _getResendButton(resendCodeStyle);

          nextPageButton = Container(
              width: double.infinity,
              height: nextPageButtonHeight,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration:
              BoxDecoration(
                  color: BUTTON_COLOR,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: new TextButton(
                  onPressed: () {
                    String pinCode = pinCodeController.text.toString();

                    // If a whole verification code hasn't been entered
                    if (pinCode.length < 5) {
                      _showDialog("Please Enter the Full Code", "");
                    } else {
                      // Test pin code, if correct go to username screen
                      if (pinCode == "12345") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                CheckExistingUserScreen(userPhoneNumber)));
                      } else {
                        _showDialog("Incorrect Code", "Please enter the code again or request a new code");

                      }
                      /*
                        // Verify the pin code
                        PhoneAuthProvider.credential(
                            verificationId: verificationCode,
                            smsCode: pinCode
                        );*/

                      /// Have something to skip the username entry if the
                      /// phone is already used
                    }
                  }
                  ,
                  child: Text("Next", style: nextPageButtonStyle)
              )
          );

          return Column(
              children: <Widget>[
                Column(
                    children: <Widget>[
                      widgetGen.getBackButton(
                          context, ParentPhoneNumScreen()),
                      SizedBox(height: topSpacing,),
                      widgetGen.getTitleCenter(
                          "Enter the code we just texted you (enter 12345)", titleTextStyle),
                      SizedBox(height: 40,),
                      pinCodeTextField,
                      resendButton,
                      SizedBox(height: 60,),
                      nextPageButton
                    ]
                ),
              ]
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<bool>(
        future: _sendAuthCode(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return loadingScreen;

          } else if (snapshot.hasData) {

            // If the code wasn't set, or some null, return loading
            if (snapshot.data == true) {

              return Scaffold(
                  body: Container(
                    color: Colors.white,
                    // 100$ of screen height
                    height: double.infinity,
                    // 100% of screen width
                    width: double.infinity,

                    child: _getBody()
                  ));
              } else {
              return loadingScreen;
            }
            } else {
            return loadingScreen;
          }
        }
    );
  }

}
import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../username_entry.dart';
import '../verification.dart';
import 'UI_Widgets.dart';

///
/// CANT HAVE IT CHECK THE CODE ON THE PINCODE TEXTFIELD BEING CHANGED
///
/// ALSO NEED IT TO CHECK WHETHER OR NOT THERE IS AN ACCOUNT ASSOCIATED WITH THE PHONE NUMBER TO SKIP THE VERIFICATION
///

class VerificationBody extends State<VerificationScreen> {

  String userPhoneNumber;
  VerificationBody(this.userPhoneNumber);

  var verificationCodeEntered = false;
  var verificationCode = "";
  var resendCode = 0;
  var isLoading = true;
  var isVerified = false;

  @override
  Widget build(BuildContext context) {


    ///
    /// IN THE FUTURE ADD A RESEND CODE BUTTON
    ///
    /// MAKE IT LOAD WHILE YOU WAIT
    ///

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    auth.verifyPhoneNumber(
      phoneNumber: userPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // If verified successfully, sign in with the phone as the credential
        auth.signInWithCredential(credential).then((user) async => {
          if (user != null) {
            // Logged in
            await firestore.
            collection('users').
            doc(auth.currentUser!.uid).
            set({
              // DATA THAT IS PASSED INTO HOMEPAGE
              ///
              /// ???
              ///
            }).then((value) => {
             setState(() {
               isLoading = false;
               isVerified = true;
             })
            }
            )
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint('Error logging in: ' + e.message!);
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        // Firebase has sent the code and we store it for checking it is correct
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
          resendCode = resendToken!;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );

    WidgetGenerator widgetGen = WidgetGenerator();


    var resendButton = Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: TextButton(
          child: Text("Resend Code", style: FINAL_NEXT_PAGE_BUTTON_STYLE,),
          onPressed: () {
            auth.verifyPhoneNumber(
                phoneNumber: userPhoneNumber,
                verificationCompleted: (PhoneAuthCredential credential) {
                  // If verified successfully, sign in with the phone as the credential
                  auth.signInWithCredential(credential).then((user) async => {
                    if (user != null) {
                      // Logged in
                      await firestore.
                      collection('users').
                      doc(auth.currentUser!.uid).
                      set({
                        // DATA THAT IS PASSED INTO HOMEPAGE
                        ///
                        /// ???
                        ///
                      }).then((value) => {
                        setState(() {
                          isLoading = false;
                          isVerified = true;
                        })
                      }
                      )
                    }
                  });
                },
                verificationFailed: (FirebaseAuthException e) {
                  debugPrint('Error logging in: ' + e.message!);
                  setState(() {
                    isLoading = false;
                  });
                },
                codeSent: (String verificationId, int? resendToken) {
                  // Firebase has sent the code and we store it for checking it is correct
                  setState(() {
                    isLoading = false;
                    verificationCode = verificationId;
                    resendCode = resendToken!;
                  });
                },
                codeAutoRetrievalTimeout: (String verificationId) {
                  setState(() {
                    isLoading = false;
                    verificationCode = verificationId;
                  });
                },
                timeout: Duration(seconds: 60),
                forceResendingToken: resendCode
            );
          },
        ),
      ),
    );

    var pinCodeController = TextEditingController();

    var pinCodeTextField = Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Align(
            alignment: Alignment.topCenter,
            child: PinCodeTextField(
              keyboardType: TextInputType.number,
              length: 5,
              controller: pinCodeController,
              onChanged: (value) {
                setState(() async {
                  // If a full verification code has been entered
                  if (value.toString().length == 5) {
                    AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationCode,
                        smsCode: value
                    );
                    
                    var result = await auth.signInWithCredential(credential);

                    var user = result.user;

                    if (user != null) {
                      // Authentication successful, allow the use to continue
                      verificationCodeEntered = true;
                    } else {
                      // Show the user a popup that the code was incorrect
                      showDialog(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Incorrect Code"),
                          content: Text("Please re-enter the code or request a new one"),
                          actions: [
                            TextButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                      // Clear the pin-code box
                      pinCodeController.clear();
                    }

                  }
                });
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

    return Container(
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
                  ///
                  /// Need to add firebase phone num verification
                  ///
                  pinCodeTextField,
                  SizedBox(height:10),
                  resendButton,
                  SizedBox(height: 60,),
                  widgetGen.getNextPageButton(context, ParentUsernameEntryScreen(), verificationCodeEntered)
                ]
            ),
            ///
            /// HAVE THE SIGN IN BUTTON BE GREY UNTIL TEXT IS PUT IN AND IN THE MIDDLE OF THE SCREEN
            ///
          ]
      ),
    );
  }

}
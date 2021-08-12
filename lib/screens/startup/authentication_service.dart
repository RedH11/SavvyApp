import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cryptoapp/models/user.dart';
import 'firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  var _verificationID;

  late AppUser _currentUser;
  AppUser get currentUser => _currentUser;

  Future<bool> getTestUser() async {
    _firebaseAuth.signInAnonymously();
    return true;
  }

  Future loginWithPhone(String phoneNumber) async {

    var codeWasSent = false;

    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      print("Phone number automatically verified and user signed in: ${_firebaseAuth.currentUser?.uid ?? "no uid found"}");
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    //Callback for when the code is sent
    PhoneCodeSent codeSent = (String verificationId, int? resendToken) {
          print('Please check your phone for the verification code.');
          _verificationID = verificationId;
          codeWasSent = true;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("verification code: " + verificationId);
      _verificationID = verificationId;
    };

    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print("Failed to Verify Phone Number: ${e}");
    }

    return codeWasSent;
  }

  Future<bool> resendAuthCode(String phoneNumber, var resendCode) async {

    var codeWasSent = false;

    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      print("Phone number automatically verified and user signed in: ${_firebaseAuth.currentUser?.uid ?? "no uid found"}");
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    //Callback for when the code is sent
    PhoneCodeSent codeSent = (String verificationId, int? resendToken) {
      print('Please check your phone for the verification code.');
      _verificationID = verificationId;
      codeWasSent = true;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("verification code: " + verificationId);
      _verificationID = verificationId;
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        timeout: Duration(seconds: 60),
        forceResendingToken: resendCode
    );

    print("Code was sent is " + codeWasSent.toString());

    return codeWasSent;

  }

  ///
  /// HAVE TO MAKE IT WITH THE PHONE NUMBER
  ///
  /*Future signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
    required String role,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = AppUser(
        authResult.user.uid, email,
        fullName,
        role,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
  */

  Future<bool> isUserLoggedIn() async {
    return (await _firebaseAuth.currentUser != null);
  }

  Future<String> getUserUID() async {
    return (await _firebaseAuth.currentUser!.uid);
  }
}
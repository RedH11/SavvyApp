import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var _verificationID;

  // Even if firebase shows that the user is logged in, checks for the
  // state where the user doesn't complete login which means their user has
  // no info in it
  Future<bool> isUserCreated(String userUID) async {
    var userInfo = await _firestore.collection('users')
        .where('uid', isEqualTo: userUID)
        .get();

    return userInfo.docs.first.exists;
  }

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

    return codeWasSent;

  }

  Future<bool> usernameIsTaken(String username) async {

    final result = await _firestore.collection("users").where('username', isEqualTo: username).get();
    //converts results to a list of documents
    final List<DocumentSnapshot> documents =
        result.docs;

    return documents.length != 0;
  }

  Future<void> initializeUser(String userUID, String username, String phoneNumber) async {

    await _firestore.collection("users").add({
      // Core info
      "uid" : userUID,
      "username" : username,
      "phone_number" : phoneNumber,
      "notifications_enabled" : true,
      "balance" : 0.00,
      "invites_available" : 1, // all users start with one invite
      "current_events" : [], // array of event ids

      // Goal-related info
      "events_joined" : 0,
      "invites_sent" : 0,

    }).catchError((error) => {
      print("Error getting user in authentication_service, $error")
    });

  }

  Future<bool> isUserLoggedIn() async {
    return (await _firebaseAuth.currentUser != null);
  }

  Future<String> getUserUID() async {
    String userUID = await _firebaseAuth.currentUser?.uid ?? "";
    return userUID;
  }
}
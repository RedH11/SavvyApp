import 'package:cryptoapp/screens/startup/startup.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/settings.dart';
import 'package:cryptoapp/theme/text_styles.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


///
/// GET RID OF THE AIRPLANE AND HAVE A PERMANENT NOTIFICATION FOR BEING ABLE TO SEND AN INVITE
///
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only allow the app to be viewed in portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //runApp(MyApp());

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {

    ///
    /// Get the UTC offset
    ///

    return MaterialApp(
      title: 'CryptoApp',
      theme: ThemeData(
          // Default Brightness and Colors
          brightness: Brightness.light,
          primaryColor: PRIMARY_TEXT_COLOR,

          // Default font family
          fontFamily: "Helvetica Neue",

          // Default TextThemes
          textTheme: TextTheme(
            headline1: MAIN_HEADING_STYLE,
            headline2: SECTION_TITLE_BOLD_STYLE,
            bodyText1: MAIN_BODY_STYLE,
          ),
          buttonColor: BUTTON_COLOR,
          visualDensity: VisualDensity
              .adaptivePlatformDensity // Conforms the UI to the screen size

          ),
      // For device preview extension
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      home:  FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          // Check if there are any general errors
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          // Check if the user is logged in
          } else if (snapshot.hasData) {
            return StartupScreen();
          // Without wifi just show a circular progress indicator
          } else {
            print("Nothing Found, Show Loading");
            return Center(
              child: SpinKitThreeBounce(
                  color: BUTTON_COLOR,
                  size: 50.0
              )
            );
          }
        },
      ),
    );
  }
}

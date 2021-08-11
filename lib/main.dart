import 'package:cryptoapp/screens/events/events_info.dart';
import 'package:cryptoapp/screens/events/events_loading.dart';
import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/screens/loading/loading.dart';
import 'package:cryptoapp/screens/notifications/notifications.dart';
import 'package:cryptoapp/screens/personal_stats/personal_stats.dart';
import 'package:cryptoapp/screens/settings/settings.dart';
import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:cryptoapp/screens/startup/startup.dart';
import 'package:cryptoapp/screens/widgets/stats_display.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


///
/// GET RID OF THE AIRPLANE AND HAVE A PERMANENT NOTIFICATION FOR BEING ABLE TO SEND AN INVITE
///
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
          primaryColor: primaryTextColor,

          // Default font family
          fontFamily: "Helvetica Neue",

          // Default TextThemes
          textTheme: TextTheme(
            headline1: mainHeadingStyle,
            headline2: sectionTitleBoldStyle,
            bodyText1: mainBodyStyle,
          ),
          buttonColor: BUTTON_COLOR,
          visualDensity: VisualDensity
              .adaptivePlatformDensity // Conforms the UI to the screen size

          ),
      home:  FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          // Check if there are any general errors
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          // Check if the user is logged in
          } else if (snapshot.hasData) {
            print("Going to startup screen!");
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
      //home: HomeScreen(),
    );
  }
}

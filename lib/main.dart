import 'package:cryptoapp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/intro/intro.dart';
import 'package:cryptoapp/theme/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoApp',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: primaryTextColor),
        buttonColor: primaryButtonColor,
        visualDensity: VisualDensity.adaptivePlatformDensity // Conforms the UI to the screen size
      ),
      home: IntroScreen(),
    );
  }
}

///
///       // theme: ThemeData(
//       //   primarySwatch: Colors.blue),
//         //"/ExScreen2": (BuildContext context) => Sign-InPage,
//       },
//       // home: MyHomePage(title: 'Flutter Demo Home Page'),
//      initialRoute: '/',
//       routes: <String, WidgetBuilder>{
//         "/": (BuildContext context) => HomePage(),
///
import 'package:cryptoapp/screens/home/home.dart';
import 'package:cryptoapp/theme/style.dart';
import 'package:flutter/material.dart';
//import 'package:cryptoapp/theme/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoApp',
      theme: appTheme(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => HomePage(),
        //"/ExScreen2": (BuildContext context) => Sign-InPage,
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

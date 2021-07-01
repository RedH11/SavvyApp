import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/intro/components/body.dart';

///
/// https://stackoverflow.com/questions/50751226/how-to-dynamically-resize-text-in-flutter
/// Probably have to dynamically size a lot of the text
/// 
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}


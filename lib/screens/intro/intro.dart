import 'package:cryptoapp/screens/sign-in/get_phone_num.dart';
import 'package:cryptoapp/widgets/screen_templates/info_screen.dart';
import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InformationScreen(
        title: 'Our Community',
        imagePath: './lib/assets/images/community.svg',
        pageNumber: 1,
        nextScreen: SecondScreen(),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InformationScreen(
          title: 'Join Events',
          imagePath: './lib/assets/images/events.svg',
          pageNumber: 2,
          nextScreen: ThirdScreen(),
        )
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InformationScreen(
          title: 'Make Bank',
          imagePath: './lib/assets/images/profit.svg',
          pageNumber: 3,
          nextScreen: FourthScreen(),
        )
    );
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InformationScreen(
          title: 'Get Rewards',
          imagePath: './lib/assets/images/rewards.svg',
          pageNumber: 4,
          nextScreen: FifthScreen(),
        )
    );
  }
}

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InformationScreen(
          title: 'Let\'s Get Started',
          imagePath: './lib/assets/images/get_started.svg',
          pageNumber: 5,
          nextScreen: ParentPhoneNumScreen(),
        )
    );
  }
}

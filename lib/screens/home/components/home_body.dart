import 'package:cryptoapp/screens/home/components/all_events.dart';
import 'package:cryptoapp/screens/home/components/coins.dart';
import 'package:cryptoapp/screens/home/components/your_events.dart';
import 'package:cryptoapp/theme/settings.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';
// Main body of home screen
class HomeBody extends StatelessWidget {
  var userEvents, allEvents, utcOffset;
  HomeBody(this.userEvents, this.allEvents, this.utcOffset);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: BACKGROUND_COLOR,
      child: Column(
        children: <Widget>[Coins(), YourEvents(userEvents, utcOffset), AllEvents(allEvents, utcOffset)],
      ),
    );
  }
}

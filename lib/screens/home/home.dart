import 'dart:convert';

import 'package:cryptoapp/screens/widgets/app_bar.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/screens/home/components/home_body.dart';
import 'package:cryptoapp/models/event.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

// Main home class
class HomeScreen extends StatelessWidget {

  final String userUID;
  HomeScreen(this.userUID);

  Future<List<dynamic>> _getNetworkData() async {

    ///
    /// Get the event data with the user information, get the timezone and the utc offset
    ///
    /// PASS THE UTC OFFSET TO THE EVENT INFO CLASS
    ///
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$currentTimeZone'));
    Map data = jsonDecode(response.body);
    var utcOffset = data['utc_offset'].toString().substring(0, 3);

    return [utcOffset, "second piece of text"];
  }

  @override
  Widget build(BuildContext context) {

    String utcOffset = "";
    // Ongoing events the user is currently a part of
    var userEvents = [
      InvestingEvent("Blitz", "1", "High risk High reward investing in blockchain", DateTime.utc(2021, 8, 11), DateTime.utc(2021, 8, 14, 6, 6, 6))
    ];
    // All other events that are to be opened or the user isn't a part of
    var allEvents = [
      InvestingEvent("Virtual Art", "1", "High risk High reward investing in blockchain", DateTime.utc(2021, 8, 11), DateTime.utc(2021, 8, 15, 6, 6, 6))
    ];

    ///
    /// Get the userEvents and allEvents to pass
    ///

    return FutureBuilder<List<dynamic>>(
      future: _getNetworkData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("THERE WAS AN ERROR!");
          return Scaffold(
              body: Center(
                  child: SpinKitThreeBounce(
                      color: BUTTON_COLOR,
                      size: 50.0
                  )
              )
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            body: Padding(padding: EdgeInsets.symmetric(vertical: 100), child:Text(userUID)),
          );
          /*return Scaffold(
            backgroundColor: Colors.white,
            appBar: TopAppBar().getAppBar("Dashboard", true, false, context),
            body: HomeBody(userEvents, allEvents, utcOffset),
          );*/
        } else {
          return Scaffold(
              body: Center(
                  child: SpinKitThreeBounce(
                      color: BUTTON_COLOR,
                      size: 50.0
                  )
              )
          );
        }
      }
    );
  }
}

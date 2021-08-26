import 'package:cryptoapp/widgets/app_bar.dart';
import 'package:cryptoapp/widgets/settings_display.dart';
import 'package:cryptoapp/widgets/containers/white_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // App bar variables
    bool hasNotification = false;
    bool useMenuIcons = false;
    bool useBackButton = true;

    return Scaffold(
      appBar: TopAppBar().getAppBar("Settings", useMenuIcons, useBackButton, hasNotification, context),
      body: SettingsState(),
    );
  }
}

class SettingsState extends StatefulWidget {
  @override
  SettingsBody createState() => SettingsBody();
}

class SettingsBody extends State<SettingsState> {

  var notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    var username = "@username";
    var termsOfServiceLink = "https://google.com";
    var privacyPolicyLink = "";

    var settingsDisplay = SettingsDisplay();
    ///
    /// Have the terms of service and privacy policy buttons go to website
    ///

    var summaryDivider = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        color: DIVIDER_COLOR,
        thickness: 1.0,
      ),
    );

    var pauseNotificationsDisplay = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Container(
        // Width of the entire container
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Pause Notifications", style: STATS_BODY_STYLE),
              )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        notificationsEnabled = value;
                      });

                      settingsDisplay.setNotifications(!value); // opposite value
                    },
                  )
              ),
            ],
          )
      ),
    );

    return Container(
          color: BACKGROUND_COLOR,
          child: Column(
        children: <Widget> [ WhiteContainer.init(
              10.0,
              [
                SizedBox(height: 10,),
                settingsDisplay.getDisplay(username),
                summaryDivider,
                pauseNotificationsDisplay,
                summaryDivider,
                settingsDisplay.getLinkDisplay("Terms of Service", termsOfServiceLink),
                summaryDivider,
                settingsDisplay.getLinkDisplay("Privacy Policy", privacyPolicyLink),
                summaryDivider,
                settingsDisplay.getDisplay("For any questions / issues, email us at savvyapphelp@gmail.com"),
                SizedBox(height: 10,),
              ]
          ),

          SizedBox(height: 10,),
          settingsDisplay.getLogOutButton(context)
        ]
      )
    );
  }
}
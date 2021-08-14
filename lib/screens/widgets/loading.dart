import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget {

  Scaffold getLoadingScreen() {
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
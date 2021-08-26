import 'package:flutter/cupertino.dart';
import 'package:cryptoapp/theme/colors.dart';

class BackgroundContainer extends StatelessWidget {

  final Widget child;
  BackgroundContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 100% of the screen size
      width: double.infinity,
      height: double.infinity,

      color: BACKGROUND_COLOR,
      child: child,
    );
  }


}
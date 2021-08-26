import 'package:cryptoapp/theme/settings.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';
class LevelProgressBar extends StatelessWidget {
  final double max;
  final double current;
  final Color color;

  const LevelProgressBar(
      {Key? key,
        required this.max,
        required this.current,
        this.color = MONEY_TEXT_COLOR})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (current / max) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: 20,
              decoration: BoxDecoration(
                color: progressBarBackgroundColor,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: percent,
              height: 20,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ],
        );
      },
    );
  }
}
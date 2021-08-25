import 'package:cryptoapp/models/goal.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../../widgets/alignment_padding.dart';

class GoalDisplay {

  static Padding init(Goal goalInfo, TextStyle goalDisplayStyle, goalWidth, goalHeight) {

    Align goalNameDisplay = AlignmentPadding.forWidget(
        Text(goalInfo.name, style: goalDisplayStyle,),
        Alignment.centerLeft,
        EdgeInsets.symmetric(vertical: 0, horizontal: 10)
    );

    Align goalCountDisplay = AlignmentPadding.forWidget(
      Text(("0 / " + goalInfo.objectiveTotal.toString()), style: goalDisplayStyle,),
      Alignment.centerRight,
      EdgeInsets.fromLTRB(20, 0, 0, 0)
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Container(
              width: goalWidth,
              height: goalHeight,
              decoration:
                BoxDecoration(
                    color: treeGreenEventColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
              child: goalNameDisplay
              ),
          goalCountDisplay
          ],
        ),
      ),
    );
  }

}
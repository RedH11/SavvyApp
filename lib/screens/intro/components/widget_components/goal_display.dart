import 'package:cryptoapp/models/goal.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/material.dart';

import 'alignment_padding.dart';

class GoalDisplay {

  static Padding init(Goal goalInfo) {

    Align goalNameDisplay = AlignmentPadding.forWidget(
        Text(goalInfo.name, style: goalDisplayStyle,),
        Alignment.centerLeft,
        EdgeInsets.symmetric(vertical: 0, horizontal: 10)
    );

    ///
    /// When implemented for the real goal system,
    /// will have to pull current stats from firebase for the objective
    ///

    Align goalCountDisplay = AlignmentPadding.forWidget(
      Text(("0 / " + goalInfo.objectiveTotal.toString())),
      Alignment.centerRight,
      EdgeInsets.fromLTRB(20, 0, 0, 0)
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Container(
              width: 250.0,
              height: 30.0,
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
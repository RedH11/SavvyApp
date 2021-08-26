import 'package:cryptoapp/theme/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';
class EventsDisplay {

  Padding getDescriptionBlock(emoji, description) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 60, 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: EVENT_DESCRIPTION_EMOJI_STYLE),
            SizedBox(width: 20,),
            Expanded(child: Text(description, style: EVENT_DESCRIPTION_STYLE))
          ],
        ),
      ),
    );
  }

  Padding getCoinsDisplay(String coinAmount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(coinAmount, style: EVENT_DESCRIPTION_COINS_STYLE),
            Text("🪙", style: EVENT_DESCRIPTION_COINS_STYLE)
          ],
        ),
      ),
    );
  }

  void triggerJoinEvent(String eventID) {
    // Go to join event screen and pass the Event ID along
  }

  Align getJoinEventButton(String eventID) {
    return Align(
      alignment: Alignment.bottomCenter, child:  Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.fromLTRB(sidePadding, 0, sidePadding, 0),
        decoration:
        BoxDecoration(
            color: BUTTON_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: new TextButton(
            onPressed: () => {
              triggerJoinEvent(eventID)
            },
            child: Text("Join Event!", style: FINAL_NEXT_PAGE_BUTTON_STYLE)
        )
    ),
    );
  }
}
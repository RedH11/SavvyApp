import 'package:cryptoapp/screens/widgets/white_container.dart';
import 'package:cryptoapp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationsDisplay {

  Widget getNotifications(int invAmount) {

    var hasInvite = invAmount > 0;

    if (hasInvite == false) {
      return getNoNotificationsText();
    } else {
      return getInviteContainer(invAmount);
    }
  }


  Widget getNoNotificationsText() {
    return Center(
      child: Text("You have no new notifications", style: MAIN_BODY_STYLE,),
    );
  }

  bool invitePhoneNum(phoneNum) {
    // Return if it went through successfully
    return true;
  }

  Widget getInviteContainer(int invAmount) {

    var invText = "";

    if (invAmount > 1) {
      invText = "✉️ You Have $invAmount Invites ✉️";
    } else {
      invText = "✉️ You Have $invAmount Invite ✉️";
    }

    return WhiteContainer.init(
        10.0,
        [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text(invText, style: INVITE_TITLE_STYLE,)
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Who would be a great addition to our community?", style: INVITE_BODY_STYLE)
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                ],
                keyboardType: TextInputType.number,
                enableSuggestions: false,
                style: INVITE_INPUT_STYLE,
                autocorrect: false,
                maxLength: 12,
                cursorColor: primaryTextColor,
                decoration: InputDecoration(
                    hintText: "441234567890"
                ),
                  onSubmitted: (num) => {
                    invitePhoneNum(num)
                  },
              ),
              ),
              SizedBox(height: 10,),
            ],),
          ),
        ]
    );
  }
}
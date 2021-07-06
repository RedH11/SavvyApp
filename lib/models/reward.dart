import 'package:cryptoapp/models/objectiveType.dart';

class Reward {

  String name = "";
  var xpValue = 0.0;
  var rewardLevel = 0;
  ObjectiveType objectiveType = ObjectiveType.UNDEFINED;
  var objectiveTotal = 0;

  Map<ObjectiveType, String> rewardNames = {
    ObjectiveType.INVITE: "Invite _ People to Savvy",
    ObjectiveType.BALANCE: "Get to _ \$SavvyCoins",
    ObjectiveType.EVENT: "Join _ Events",
    ObjectiveType.ART_EVENT: "Join _ ART Events",
    ObjectiveType.BLZ_EVENT: "Join _ BLZ Events",
    ObjectiveType.MST_EVENT: "Join _ MST Events",
    ObjectiveType.RST_EVENT: "Join _ RST Events",
    ObjectiveType.INVEST: "Invest _ \$SavvyCoins"
  };

  Reward(ObjectiveType objectiveType,
  var objectiveTotal, var xpValue, var rewardLevel) {
    this.objectiveType = objectiveType;
    this.objectiveTotal = objectiveTotal;
    this.name =
        rewardNames[objectiveType]!.replaceAll("_", objectiveTotal.toString());
    this.xpValue = xpValue;
    this.rewardLevel = rewardLevel;
  }
}
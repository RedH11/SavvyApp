import 'package:cryptoapp/models/reward.dart';
import 'package:cryptoapp/models/objectiveType.dart';

var allGoals = [
  // Objective Type, Objective Total, XP Value, Objective Difficulty
  // Invite - Invite a certain amount of people
  Reward(ObjectiveType.INVITE, 1, 20, 1),
  // Investing - Invest a certain amount of coins
  Reward(ObjectiveType.INVEST, 10, 60, 1),
  Reward(ObjectiveType.INVEST, 15, 60, 2),
  Reward(ObjectiveType.INVEST, 20, 60, 3),
  Reward(ObjectiveType.INVEST, 25, 60, 4),
  Reward(ObjectiveType.INVEST, 30, 60, 5),
  Reward(ObjectiveType.INVEST, 35, 60, 6),
  Reward(ObjectiveType.INVEST, 40, 60, 7),
  // Balance - Have a certain amount of coins
  Reward(ObjectiveType.BALANCE, 10, 100, 1),
  Reward(ObjectiveType.BALANCE, 20, 100, 2),
  Reward(ObjectiveType.BALANCE, 30, 100, 3),
  Reward(ObjectiveType.BALANCE, 40, 100, 4),
  Reward(ObjectiveType.BALANCE, 50, 100, 5),
  Reward(ObjectiveType.BALANCE, 60, 100, 6),
  Reward(ObjectiveType.BALANCE, 70, 100, 7),
  // Event - Join a certain amount of events
  Reward(ObjectiveType.EVENT, 1, 40, 1),
  Reward(ObjectiveType.EVENT, 3, 40, 2),
  Reward(ObjectiveType.EVENT, 6, 40, 3),
  Reward(ObjectiveType.EVENT, 8, 40, 4),
  Reward(ObjectiveType.EVENT, 10, 40, 5),
  Reward(ObjectiveType.EVENT, 12, 40, 6),
  Reward(ObjectiveType.EVENT, 14, 40, 7),
];
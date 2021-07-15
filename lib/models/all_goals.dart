import 'package:cryptoapp/models/goal.dart';
import 'package:cryptoapp/models/objectiveType.dart';

var allGoals = [
  // Objective Type, Objective Total, XP Value, Objective Difficulty
  // Invite - Invite a certain amount of people
  Goal(ObjectiveType.INVITE, 1, 20, 1),
  // Investing - Invest a certain amount of coins
  Goal(ObjectiveType.INVEST, 10, 60, 1),
  Goal(ObjectiveType.INVEST, 15, 60, 2),
  Goal(ObjectiveType.INVEST, 20, 60, 3),
  Goal(ObjectiveType.INVEST, 25, 60, 4),
  Goal(ObjectiveType.INVEST, 30, 60, 5),
  Goal(ObjectiveType.INVEST, 35, 60, 6),
  Goal(ObjectiveType.INVEST, 40, 60, 7),
  // Balance - Have a certain amount of coins
  Goal(ObjectiveType.BALANCE, 10, 100, 1),
  Goal(ObjectiveType.BALANCE, 20, 100, 2),
  Goal(ObjectiveType.BALANCE, 30, 100, 3),
  Goal(ObjectiveType.BALANCE, 40, 100, 4),
  Goal(ObjectiveType.BALANCE, 50, 100, 5),
  Goal(ObjectiveType.BALANCE, 60, 100, 6),
  Goal(ObjectiveType.BALANCE, 70, 100, 7),
  // Event - Join a certain amount of events
  Goal(ObjectiveType.EVENT, 2, 40, 1),
  Goal(ObjectiveType.EVENT, 3, 40, 2),
  Goal(ObjectiveType.EVENT, 6, 40, 3),
  Goal(ObjectiveType.EVENT, 8, 40, 4),
  Goal(ObjectiveType.EVENT, 10, 40, 5),
  Goal(ObjectiveType.EVENT, 12, 40, 6),
  Goal(ObjectiveType.EVENT, 14, 40, 7),
];
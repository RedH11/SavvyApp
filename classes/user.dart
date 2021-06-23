import 'package:flutter/material.dart';

/*
WHEN WE INTEGRATE FIREBASE WE JUST HAVE TO MAKE SURE THE TRAFFIC IS END TO END ENCRYPTED
 */
class User {
  String uid = "";
  String username = "";
  String password = "";
  int coinCount = 0;
  Map<String, int> investments = {}; // {Event ID, Coin's Invested}
}

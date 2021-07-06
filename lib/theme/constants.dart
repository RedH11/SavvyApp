import 'dart:ui';

import 'package:flutter/material.dart';

/* COLORS */
// Almost black blue
const primaryTextColor = Color.fromARGB(255, 56, 55, 74);
// Light gray
const secondaryTextColor = Color.fromARGB(255, 149, 143, 143);
// Semi-light gray
const darkerSecondaryTextColor = Color.fromARGB(255, 139, 139, 140);
// Very light gray
const backgroundColor = Color.fromARGB(255, 243, 243, 243);
// White
const containerColor = Color.fromARGB(255, 255, 255, 255);
// Semi-dark green
const buttonColor = Color.fromARGB(255, 86, 170, 104);
// Lighter green
const greenTextColor = Color.fromARGB(255, 86, 170, 104);
//Color.fromARGB(255, 87, 190, 130);
// Lighter blue
const blueTextColor = Color.fromARGB(255, 120, 161, 228);
// Green button color
const primaryButtonColor = Color.fromARGB(255, 86, 170, 104);
// Light Red
const blitzEventColor = Color.fromARGB(255, 253, 236, 236);
// Light blue
const artEventColor = Color.fromARGB(255, 238, 242, 251);
// Light Yellow
const realestateEventColor = Color.fromARGB(255, 252, 253, 236);
// Light Orange
const mainstreamEventColor = Color.fromARGB(255, 253, 245, 236);
// Light Green
const treeGreenEventColor = Color.fromARGB(255, 236, 253, 237);
// Light grey
const progressBarBackgroundColor = Color.fromARGB(255, 238, 238, 238);

/* FONT */
const main_font = "Sofia Pro";
const mainHeadingStyle = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: primaryTextColor);
const mainBodyStyle = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: primaryTextColor);
const mainBodyBoldStyle = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: primaryTextColor);
const topHeadingStyle = TextStyle(fontFamily: main_font, fontSize: 25, color: primaryTextColor);
const sectionTitleStyle = TextStyle(fontFamily: main_font, fontSize: 15, color: primaryTextColor);
const sectionTitleBoldStyle = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: primaryTextColor);
const eventTitleStyle = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor);
const eventSubtitleStyle = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor);
const eventTimerStyle = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: primaryTextColor);
const levelDisplayStyle = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const redeemRewardsStyle = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
const goalsTitleStyle = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.bold, color: primaryTextColor);

/* SPACING */
const double sidePadding = 20;
const double topPadding = 100; // From containers to the top of the page
const double betweenContainers = 10;

/* DIMENSIONS */
const buttonHeight = 60;
const containerRoundness = 15.0;
const buttonRoundness = 15.0;

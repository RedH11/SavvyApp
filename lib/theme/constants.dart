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
// Lighter green
const greenTextColor = Color.fromARGB(255, 86, 170, 104);
//Color.fromARGB(255, 87, 190, 130);
// Lighter blue
const blueTextColor = Color.fromARGB(255, 120, 161, 228);
// Green button color
const BUTTON_COLOR = Color.fromARGB(255, 86, 170, 104);
const FADED_BUTTON_COLOR = Color.fromARGB(100, 86, 170, 104);
// Light grey text-field bottom color
const TEXT_FIELD_COLOR = Color.fromARGB(255, 195, 195, 195);
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
// Light grey
const DIVIDER_COLOR = Color.fromARGB(107, 112, 112, 112);
// Green
const MONEY_TEXT_COLOR = Color.fromARGB(255, 87, 190, 130);
// Light Grey
const PROGRESS_BAR_BACKGROUND_COLOR = Color.fromARGB(255, 238, 238, 238);
// Darker red
const LOG_OUT_BUTTON_COLOR = Color.fromARGB(255, 206, 32, 32);

/* FONT */
const main_font = "Sofia Pro";
const mainHeadingStyle = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: primaryTextColor);
const mainHeadingBoldStyle = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: primaryTextColor);
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
const goalDisplayStyle = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: primaryTextColor);
const FINAL_NEXT_PAGE_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
const TEXT_FIELD_LABEL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: TEXT_FIELD_COLOR);
const INTRO_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: primaryTextColor);
const TEXT_FIELD_INPUT_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: primaryTextColor);
const STATS_COIN_VAL_STYLE = TextStyle(fontFamily: main_font, fontSize: 60, fontWeight: FontWeight.normal, color: primaryTextColor);
const STATS_SECTION_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: primaryTextColor);
const STATS_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: primaryTextColor);
const STATS_BODY_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: primaryTextColor);
const STATS_BODY_MONEY_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: MONEY_TEXT_COLOR);
const STATS_BODY_MONEY_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: MONEY_TEXT_COLOR);
const STATS_LEVEL_DISPLAY_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: MONEY_TEXT_COLOR);
const REDEEM_REWARDS_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
const STATS_GOALS_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: primaryTextColor);
const LOG_OUT_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.bold, color: LOG_OUT_BUTTON_COLOR);
const EVENT_DESCRIPTION_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: primaryTextColor);
const EVENT_DESCRIPTION_EMOJI_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: primaryTextColor);
const EVENT_DESCRIPTION_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.bold, color: primaryTextColor);
const EVENT_DESCRIPTION_SPOTS_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: secondaryTextColor);
const EVENT_DESCRIPTION_COINS_STYLE = TextStyle(fontFamily: main_font, fontSize: 34, fontWeight: FontWeight.bold, color: primaryTextColor);

/* SPACING */
const double sidePadding = 20;
const double topPadding = 100; // From containers to the top of the page
const double betweenContainers = 10;

/* DIMENSIONS */
const buttonHeight = 60;
const containerRoundness = 15.0;
const buttonRoundness = 15.0;

import 'dart:ui';

import 'package:flutter/material.dart';

/* Screen Sizing */
// Small screen < #
const SMALL_SCREEN = 680;
// Large screen > #
const LARGE_SCREEN = 950;

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
const BLITZ_EVENT_COLOR = Color.fromARGB(255, 253, 236, 236);
// Light blue
const ART_EVENT_COLOR = Color.fromARGB(255, 238, 242, 251);
// Light Yellow
const REALESTATE_EVENT_COLOR = Color.fromARGB(255, 252, 253, 236);
// Light Orange
const MAINSTREAM_EVENT_COLOR = Color.fromARGB(255, 253, 245, 236);
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
// blue black
const APP_BAR_ITEM_COLOR = Color.fromARGB(220, 56, 55, 74);

/* FONT */
const main_font = "Sofia Pro";
// Intro
const MAIN_HEADING_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: primaryTextColor);
const MAIN_HEADING_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 45, fontWeight: FontWeight.normal, color: primaryTextColor);
const MAIN_HEADING_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: primaryTextColor);
const MAIN_HEADING_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: primaryTextColor);
const MAIN_HEADING_BOLD_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 45, fontWeight: FontWeight.bold, color: primaryTextColor);
const MAIN_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: primaryTextColor);
const MAIN_BODY_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.bold, color: primaryTextColor);
const MAIN_BODY_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: primaryTextColor);
const MAIN_BODY_BOLD_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.bold, color: primaryTextColor);
const MAIN_BODY_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: primaryTextColor);
const MAIN_BODY_BOLD_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.bold, color: primaryTextColor);
// Event description
const TOP_HEADING_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, color: primaryTextColor);
const SECTION_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, color: primaryTextColor);
const SECTION_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, color: primaryTextColor);
const SECTION_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, color: primaryTextColor);
const SECTION_TITLE_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: primaryTextColor);
const SECTION_TITLE_BOLD_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: primaryTextColor);
const SECTION_TITLE_BOLD_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: primaryTextColor);

const EVENT_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.w400, color: primaryTextColor);
const EVENT_SUBTITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor);
const EVENT_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: primaryTextColor);
const EVENT_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.w400, color: primaryTextColor);
const EVENT_SUBTITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 10, fontWeight: FontWeight.normal, color: secondaryTextColor);
const EVENT_TIMER_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.bold, color: primaryTextColor);
const EVENT_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 26, fontWeight: FontWeight.w400, color: primaryTextColor);
const EVENT_SUBTITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: secondaryTextColor);
const EVENT_TIMER_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 22, fontWeight: FontWeight.bold, color: primaryTextColor);

// Reward description
const LEVEL_DISPLAY_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const REDEEM_REWARDS_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
const GOALS_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.bold, color: primaryTextColor);
const GOAL_DISPLAY_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: primaryTextColor);

const LEVEL_DISPLAY_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 26, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const REDEEM_REWARDS_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white);
const GOALS_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 21, fontWeight: FontWeight.bold, color: primaryTextColor);
const GOAL_DISPLAY_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: primaryTextColor);

const LEVEL_DISPLAY_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const REDEEM_REWARDS_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);
const GOALS_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: primaryTextColor);
const GOAL_DISPLAY_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: primaryTextColor);

const FINAL_NEXT_PAGE_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white);
const FINAL_NEXT_PAGE_BUTTON_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white);
const FINAL_NEXT_PAGE_BUTTON_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);

// Get phone number
const TOS_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 10, fontWeight: FontWeight.normal, color: secondaryTextColor);
const TOS_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: secondaryTextColor);
const TOS_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor);
const INTRO_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: primaryTextColor);
const INTRO_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: primaryTextColor);
const INTRO_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: primaryTextColor);

// Verification screen
const RESEND_CODE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: secondaryTextColor);
const RESEND_CODE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor);
const RESEND_CODE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: secondaryTextColor);

const TEXT_FIELD_LABEL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: TEXT_FIELD_COLOR);
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
const LOG_OUT_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: LOG_OUT_BUTTON_COLOR);
const EVENT_DESCRIPTION_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: primaryTextColor);
const EVENT_DESCRIPTION_EMOJI_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: primaryTextColor);
const EVENT_DESCRIPTION_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.bold, color: primaryTextColor);
const EVENT_DESCRIPTION_SPOTS_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: secondaryTextColor);
const EVENT_DESCRIPTION_COINS_STYLE = TextStyle(fontFamily: main_font, fontSize: 34, fontWeight: FontWeight.bold, color: primaryTextColor);
const LOADING_TEXT_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: primaryTextColor);
const INVITE_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.normal, color: primaryTextColor);
const INVITE_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: primaryTextColor);
const INVITE_INPUT_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: primaryTextColor);
const APP_BAR_TEXT_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: primaryTextColor);
const HOME_USER_EVENT_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: primaryTextColor);
const HOME_USER_EVENT_DURATION_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor);
const HOME_USER_EVENT_PERCENTAGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: primaryTextColor);
const HOME_TIMER_EMOJI_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: primaryTextColor);
const ALERT_LOGOUT_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: LOG_OUT_BUTTON_COLOR);
const ALERT_CANCEL_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: primaryTextColor);
const PRELAUNCH_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.normal, color: primaryTextColor);
const PRELAUNCH_TIMER_COLON_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.normal, color: secondaryTextColor);
const PRELAUNCH_TIMER_LABEL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: primaryTextColor);
const PRELAUNCH_TIMER_LABEL_COLORED_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: BUTTON_COLOR);
const PRELAUNCH_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: secondaryTextColor);
const PRELAUNCH_HEADING_STYLE = TextStyle(fontFamily: main_font, fontSize: 45, fontWeight: FontWeight.normal, color: primaryTextColor);

/* SPACING */
const double sidePadding = 20;
const double topPadding = 100; // From containers to the top of the page
const double betweenContainers = 10;

/* DIMENSIONS */
const buttonHeight = 60;
const containerRoundness = 15.0;
const buttonRoundness = 15.0;

/* EVENT INFO MAPS */
const Map<String, String> EVENT_ABBREVIATIONS = {
  "Blitz" : "BLZ",
  "Virtual Art" : "ART",
  "Virtual Real Estate" : "RST",
  "Mainstream" : "MST"
};

const Map <String, Color> EVENT_COLORS = {
  "BLZ" : BLITZ_EVENT_COLOR,
  "RST" : REALESTATE_EVENT_COLOR,
  "MST" : MAINSTREAM_EVENT_COLOR,
  "ART" : ART_EVENT_COLOR
};

const Map<String, String> EVENT_EMOJIS = {
  "BLZ" : "🔥",
  "RST" : "🏠",
  "MST" : "🚀",
  "ART" : "🌊"
};

/* EVENT SETTINGS */
const EVENT_LIVE_TIME = 2; // How many days before the start time the event is opened

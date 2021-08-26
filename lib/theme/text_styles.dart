import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/* FONT */
const main_font = "Sofia Pro";
// Intro

TextStyle INFO_TITLE_STYLE = GoogleFonts.asap(fontWeight: FontWeight.w700, color: PRIMARY_TEXT_COLOR);

const INFO_DESCRIPTION_STYLE = TextStyle(fontFamily: main_font, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const INFO_PAGE_NUMBER_STYLE = TextStyle(fontFamily: main_font, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);

const MAIN_HEADING_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const MAIN_HEADING_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 45, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const MAIN_HEADING_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const MAIN_HEADING_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const MAIN_HEADING_BOLD_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 45, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const MAIN_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const MAIN_BODY_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const MAIN_BODY_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const MAIN_BODY_BOLD_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const MAIN_BODY_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const MAIN_BODY_BOLD_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
// Event description
const TOP_HEADING_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, color: PRIMARY_TEXT_COLOR);
const SECTION_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, color: PRIMARY_TEXT_COLOR);
const SECTION_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, color: PRIMARY_TEXT_COLOR);
const SECTION_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, color: PRIMARY_TEXT_COLOR);
const SECTION_TITLE_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const SECTION_TITLE_BOLD_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const SECTION_TITLE_BOLD_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);

const EVENT_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR);
const EVENT_SUBTITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const EVENT_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const EVENT_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR);
const EVENT_SUBTITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 10, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const EVENT_TIMER_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const EVENT_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 26, fontWeight: FontWeight.w400, color: PRIMARY_TEXT_COLOR);
const EVENT_SUBTITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const EVENT_TIMER_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 22, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);

// Reward description
const LEVEL_DISPLAY_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const REDEEM_REWARDS_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
const GOALS_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const GOAL_DISPLAY_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);

const LEVEL_DISPLAY_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 26, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const REDEEM_REWARDS_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white);
const GOALS_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 21, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const GOAL_DISPLAY_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);

const LEVEL_DISPLAY_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic, color: greenTextColor);
const REDEEM_REWARDS_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);
const GOALS_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const GOAL_DISPLAY_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);

const FINAL_NEXT_PAGE_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white);
const FINAL_NEXT_PAGE_BUTTON_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white);
const FINAL_NEXT_PAGE_BUTTON_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);

// Get phone number
const TOS_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 10, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const TOS_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const TOS_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const INTRO_TITLE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const INTRO_TITLE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const INTRO_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);

// Verification screen
const RESEND_CODE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const RESEND_CODE_SMALL_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const RESEND_CODE_LARGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);

const TEXT_FIELD_LABEL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: TEXT_FIELD_COLOR);
const TEXT_FIELD_INPUT_STYLE = TextStyle(fontFamily: main_font, fontSize: 25, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const STATS_COIN_VAL_STYLE = TextStyle(fontFamily: main_font, fontSize: 60, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const STATS_SECTION_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const STATS_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const STATS_BODY_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const STATS_BODY_MONEY_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: MONEY_TEXT_COLOR);
const STATS_BODY_MONEY_BOLD_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.bold, color: MONEY_TEXT_COLOR);
const STATS_LEVEL_DISPLAY_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, color: MONEY_TEXT_COLOR);
const REDEEM_REWARDS_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
const STATS_GOALS_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 30, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const LOG_OUT_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: LOG_OUT_BUTTON_COLOR);
const EVENT_DESCRIPTION_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const EVENT_DESCRIPTION_EMOJI_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const EVENT_DESCRIPTION_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const EVENT_DESCRIPTION_SPOTS_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: SECONDARY_TEXT_COLOR);
const EVENT_DESCRIPTION_COINS_STYLE = TextStyle(fontFamily: main_font, fontSize: 34, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const LOADING_TEXT_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const INVITE_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const INVITE_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const INVITE_INPUT_STYLE = TextStyle(fontFamily: main_font, fontSize: 14, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const APP_BAR_TEXT_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const HOME_USER_EVENT_TITLE_STYLE = TextStyle(fontFamily: main_font, fontSize: 18, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const HOME_USER_EVENT_DURATION_STYLE = TextStyle(fontFamily: main_font, fontSize: 12, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const HOME_USER_EVENT_PERCENTAGE_STYLE = TextStyle(fontFamily: main_font, fontSize: 16, fontWeight: FontWeight.bold, color: PRIMARY_TEXT_COLOR);
const HOME_TIMER_EMOJI_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const ALERT_LOGOUT_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.bold, color: LOG_OUT_BUTTON_COLOR);
const ALERT_CANCEL_BUTTON_STYLE = TextStyle(fontFamily: main_font, fontSize: 20, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const PRELAUNCH_TIMER_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const PRELAUNCH_TIMER_COLON_STYLE = TextStyle(fontFamily: main_font, fontSize: 40, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const PRELAUNCH_TIMER_LABEL_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);
const PRELAUNCH_TIMER_LABEL_COLORED_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: BUTTON_COLOR);
const PRELAUNCH_BODY_STYLE = TextStyle(fontFamily: main_font, fontSize: 15, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR);
const PRELAUNCH_HEADING_STYLE = TextStyle(fontFamily: main_font, fontSize: 45, fontWeight: FontWeight.normal, color: PRIMARY_TEXT_COLOR);

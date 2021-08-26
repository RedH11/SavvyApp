import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

/* Screen Sizing */
// Small screen < #
const SMALL_SCREEN = 680;
// Large screen > #
const LARGE_SCREEN = 950;

/* SPACING */
const double sidePadding = 20;
const double topPadding = 100; // From containers to the top of the page
const double betweenContainers = 10;

/* DIMENSIONS */
const buttonHeight = 60;
const containerRoundness = 15.0;
const buttonRoundness = 15.0;

/* EVENT SETTINGS */
const EVENT_LIVE_TIME = 2; // How many days before an event's start it is open to be joined

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



library globals;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String loginApiPath = 'https://reqres.in/api/login';

bool isSmallDevice(context) {
  return MediaQuery.of(context).size.shortestSide < 700;
}

int getColumnCount(BuildContext context) {
  if (MediaQuery.of(context).size.width < 700)
    return 1;
  else if (MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1225)
    return 2;
  else if (MediaQuery.of(context).size.width >= 1225 &&
      MediaQuery.of(context).size.width <= 1730)
    return 3;
  else
    return 4;
}

SharedPreferences? prefs;

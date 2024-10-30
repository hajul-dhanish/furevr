import 'package:flutter/material.dart';
import 'package:furevr/data/local/shared_pref.dart';
import 'package:furevr/data/local/app_state.dart';
import 'package:furevr/routes/nav.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class Utils {
  bool isKeyboardVisible(context) {
    bool shown = MediaQuery.of(context).viewInsets.bottom == 0 ? false : true;
    return shown;
  }

  static String getCurrentYear = DateTime.now().year.toString();
  Future<void> appLoutOut(BuildContext context) async {
    await UserSharedPreferences().resetSharedPreferencess();
    if (context.mounted) {
      context.go(Navigation.splashView);
    }
  }

  Future<void> loginInit(BuildContext context, String username) async {
    AppState.isLoggedin = true;
    AppState.userName = username;
    await UserSharedPreferences().setUserNamepref(username: username);
    if (context.mounted) {
      context.pushReplacement(Navigation.homeView);
    }
  }

  String generateRandom6DigitNumber() {
    final random = Random();
    int randomNumber = 100000 + random.nextInt(900000);
    return randomNumber.toString();
  }
}

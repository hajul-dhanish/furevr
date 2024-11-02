import 'package:flutter/material.dart';
import 'package:furevr/data/local/shared_pref.dart';
import 'package:furevr/data/local/app_state.dart';
import 'package:furevr/firebase/auth_service.dart';
import 'package:furevr/routes/nav.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class Utils {
  static String noImageDisp() =>
      "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png";

  bool isKeyboardVisible(context) {
    bool shown = MediaQuery.of(context).viewInsets.bottom == 0 ? false : true;
    return shown;
  }

  static String getCurrentYear = DateTime.now().year.toString();
  Future<void> appLoutOut(BuildContext context) async {
    await UserSharedPreferences().resetSharedPreferencess();
    await AuthService().signOut(context);
    if (context.mounted) {
      context.go(Navigation.splashView);
    }
  }

  Future<void> loginInit(
      BuildContext context, String username, String userId) async {
    AppState.isLoggedin = true;
    AppState.userName = username;
    await UserSharedPreferences().setUserNamepref(username: username);
    await UserSharedPreferences().setUserIdPref(userId: userId);
    if (context.mounted) {
      context.go("/");
    }
  }

  String generateRandom6DigitNumber() {
    final random = Random();
    int randomNumber = 100000 + random.nextInt(900000);
    return randomNumber.toString();
  }

  static bool validatePhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');

    return phoneRegex.hasMatch(phoneNumber);
  }
}

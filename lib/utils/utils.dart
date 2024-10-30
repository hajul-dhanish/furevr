import 'package:flutter/material.dart';
import 'package:furevr/data/local/SharedPref.dart';
import 'package:furevr/routes/nav.dart';
import 'package:furevr/view/auth/login_view.dart';
import 'package:go_router/go_router.dart';

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
}

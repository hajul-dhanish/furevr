import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  static bool isNewUser = false;
  static bool isLoggedin = false;
  static String? userName;
  void clearAppState() {
    isLoggedin = false;
    userName = null;
  }
}

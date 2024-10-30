import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isNewUser = false;
  bool isLoggedin = false;
  String? userName;
  void clearAppState() {
    isLoggedin = false;
    userName = null;
  }
}

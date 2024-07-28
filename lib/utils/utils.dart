import 'package:flutter/material.dart';

class Utils {
  bool isKeyboardVisible(context) {
    bool shown = MediaQuery.of(context).viewInsets.bottom == 0 ? false : true;
    return shown;
  }
}

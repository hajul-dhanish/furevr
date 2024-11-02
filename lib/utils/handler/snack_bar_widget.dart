import 'package:flutter/material.dart';
import 'package:furevr/theme/color_palette.dart';

enum AlertType { warning, info, error }

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    AlertType alertType = AlertType.info,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
      action: action,
      backgroundColor: _alertColor(alertType),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Color _alertColor(AlertType alertType) {
  switch (alertType) {
    case AlertType.info:
      return ColorPalette.infoColor;
    case AlertType.warning:
      return ColorPalette.warningColor;
    case AlertType.error:
      return ColorPalette.errorColor;
    default:
      return ColorPalette.infoColor;
  }
}

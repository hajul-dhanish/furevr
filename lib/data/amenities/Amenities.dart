import 'dart:io';
import 'package:flutter/foundation.dart';

class Amenities with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isConnected = false;

  Future<bool> connectivityChecker(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
      } else {
        _isConnected = false;
      }
    } on SocketException {
      rethrow;
    } catch (e) {
      rethrow;
    }
    notifyListeners();
    return _isConnected;
  }
}

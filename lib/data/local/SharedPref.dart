import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _prefs;

  Future<void> initSharedPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setUserNamepref({required String username}) async {
    await initSharedPreferences();
    _prefs?.setString("userName", username);
  }

  Future<String> getUserNamePref() async {
    try {
      await initSharedPreferences();
      String? data = _prefs?.getString("userName");
      if (data == null) {
        return "";
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetSharedPreferencess() async {
    try {
      await initSharedPreferences();
      _prefs?.clear();
    } catch (e) {
      rethrow;
    }
  }
}

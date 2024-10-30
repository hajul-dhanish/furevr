import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  static AppLocalizations? _instance;
  static Map<String, String>? _localizedStrings;

  AppLocalizations._internal(this.locale);

  static Future<AppLocalizations> initialize(Locale locale) async {
    _instance = AppLocalizations._internal(locale);
    await _instance!._load();
    return _instance!;
  }

  Future<void> _load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static String translate(String key) {
    return _localizedStrings?[key] ?? key;
  }

  static AppLocalizations get instance {
    assert(_instance != null, 'AppLocalizations has not been initialized.');
    return _instance!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return await AppLocalizations.initialize(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

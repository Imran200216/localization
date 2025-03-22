import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['ta', 'en', 'hi', 'fr', 'ar'].contains(locale.languageCode)) return;

    _locale = locale;
    notifyListeners();
  }
}

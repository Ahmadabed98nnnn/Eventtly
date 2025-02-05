import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  void changeTheme(ThemeMode theme) async {
    themeMode = theme;
    notifyListeners();
  }

  void changeLang(String Lang) {
    languageCode = Lang;
    notifyListeners();
  }

  void getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('lang') ?? 'en';
    notifyListeners();
  }

  void getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode =
        (prefs.getBool('dark') ?? false) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  var _themeMode = ThemeMode.light;

  //this will be called on the app wherever needed.
  ThemeMode get themeMode => _themeMode;

  //this will ask the user for the theme type and set into _themeMode
  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

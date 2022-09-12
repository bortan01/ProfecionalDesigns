import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    notifyListeners();
  }

  bool get customTheme => _customTheme;
  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    notifyListeners();
  }
}

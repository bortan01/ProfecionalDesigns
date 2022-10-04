import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          backgroundColor: Colors.pink 
        );
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: //dark
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.dark().copyWith(
          // primaryColorLight: Colors.white,
          // scaffoldBackgroundColor: const Color(0XFF16202B),
          // textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: const Color(0xff48A0EB),
                background: Colors.red,
                error: Colors.red,
                errorContainer: Colors.red
              ),
        );
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  ThemeData get currentTheme => _currentTheme;

  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  bool get customTheme => _customTheme;
  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: const Color(0xff48A0EB),
            ),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
          backgroundColor: Colors.pink 
        );;
    }

    notifyListeners();
  }
}

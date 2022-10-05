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
          appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
          backgroundColor: Colors.orange,
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.deepPurple,
                background: Colors.orange,
                error: Colors.orange,
                errorContainer: Colors.orange,
                outline: Colors.white,
              ),
        );
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          backgroundColor: Colors.amber,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.green,
                background: Colors.amber,
                error: Colors.amber,
                errorContainer: Colors.amber,
                outline: Colors.white,
              ),
        );
        break;
      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.pink),
          backgroundColor: Colors.indigo,
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.pink,
                background: Colors.indigo,
                error: Colors.indigo,
                errorContainer: Colors.indigo,
                outline: Colors.white,
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
      _currentTheme =ThemeData.dark().copyWith(
          backgroundColor: Colors.amber,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.green,
                background: Colors.amber,
                error: Colors.amber,
                errorContainer: Colors.amber,
                outline: Colors.white,
              ),
        );
    } else {
      _currentTheme =ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
          backgroundColor: Colors.orange,
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.deepPurple,
                background: Colors.orange,
                error: Colors.orange,
                errorContainer: Colors.orange,
                outline: Colors.white,
              ),
        );
    }

    notifyListeners();
  }

  bool get customTheme => _customTheme;
  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme =ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.pink),
          backgroundColor: Colors.indigo,
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.pink,
                background: Colors.indigo,
                error: Colors.indigo,
                errorContainer: Colors.indigo,
                outline: Colors.white,
              ),
        );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
        backgroundColor: Colors.orange,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.deepPurple,
              background: Colors.orange,
              error: Colors.orange,
              errorContainer: Colors.orange,
              outline: Colors.white,
            ),
      );
    }

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemes {
  static const Color _darkColorBackground = Color.fromARGB(255, 32, 33, 36);
  static const Color _lightColorBackground = Color.fromARGB(255, 255, 255, 255);

  final ThemeData darkTheme = ThemeData(
    primaryColor: _darkColorBackground,
    primaryColorDark: _darkColorBackground,
    accentColor: _lightColorBackground,
    backgroundColor: _darkColorBackground,
    scaffoldBackgroundColor: _darkColorBackground,
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
  );

  final ThemeData lightTheme = ThemeData(
    primaryColor: _lightColorBackground,
    primaryColorDark: _lightColorBackground,
    accentColor: _darkColorBackground,
    backgroundColor: _lightColorBackground,
    scaffoldBackgroundColor: _lightColorBackground,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
  );

  final SystemUiOverlayStyle overlayDark = SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarColor: _darkColorBackground,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.grey,
    statusBarColor: _darkColorBackground,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  );

  final SystemUiOverlayStyle overlayLight = SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor: _lightColorBackground,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.grey,
    statusBarColor: _lightColorBackground,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  );

  ThemeData getTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }
}

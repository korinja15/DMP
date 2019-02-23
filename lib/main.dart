import 'package:Talkvee/src/theme/mythemes.dart';
import 'package:flutter/material.dart';
import 'package:Talkvee/src/view/home/home.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  bool _isDark() {
    final dark = sharedPrefs.getBool("darkmode");
    if (dark == null) {
      sharedPrefs.setBool("darkmode", false);
      return sharedPrefs.getBool("darkmode");
    }
    return dark;
  }

  final dark = _isDark();
  Brightness _brightness() {
    return dark ? Brightness.dark : Brightness.light;
  }

  runApp(
    MyApp(
      brightness: _brightness(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Brightness brightness;

  const MyApp({Key key, this.brightness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: brightness,
      data: (brightness) => MyThemes().getTheme(brightness),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Talkvee',
          theme: theme,
          home: HomeView(),
        );
      },
    );
  }
}

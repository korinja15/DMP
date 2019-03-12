import 'package:Talkvee/src/view/settings/auth_view.dart';
import 'package:Talkvee/src/view/settings/settings_view.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopupMenuTools {
  final List<PopupMenuItem> menuItems = [
    PopupMenuItem(
      child: Text("Světlý/tmavý vzhled"),
      enabled: true,
      value: 0,
    ),
    /*PopupMenuItem(
      child: Text("Nápověda"),
      enabled: true,
      value: 1,
    ),*/
  ];

  void _changeTheme(BuildContext context) async {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
    final sharedPrefs = await SharedPreferences.getInstance();
    final dark = sharedPrefs.getBool("darkmode");
    sharedPrefs.setBool("darkmode", !dark);
  }

  void selectPage(int value, BuildContext context) async {
    Widget page;
    switch (value) {
      case 0:
        _changeTheme(context);
        break;
      default:
    }
    if (page != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    }
  }
}

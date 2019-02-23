import 'package:Talkvee/src/view/settings/components/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class SettingsMenu extends StatefulWidget {
  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  Future<void> _auth() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nastavení"),
        elevation: 1,
        centerTitle: true,
      ),
      body: ListView(
          children: ListTile.divideTiles(
        context: context,
        color: Colors.grey,
        tiles: MenuItems(context).items,
      ).toList()),
    );
  }
}

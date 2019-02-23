import 'package:Talkvee/src/view/settings/view/more/more_view.dart';
import 'package:flutter/material.dart';

class MenuItems {
  final BuildContext context;

  void openPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = More();
        break;
      case 1:
        page = More();
        break;
      case 2:
        page = More();
        break;
      default:
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  final List<ListTile> items = [
    ListTile(
      title: Text("Statistiky"),
      leading: Icon(Icons.show_chart),
      onTap: () {},
    ),
    ListTile(
      title: Text("Účet"),
      leading: Icon(Icons.account_circle),
      onTap: () {},
    ),
    ListTile(
      title: Text("Nastavení"),
      leading: Icon(Icons.settings),
      onTap: () {},
    ),
  ];

  MenuItems(this.context);
}

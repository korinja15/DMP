import 'package:Talkvee/src/services/contacts_service.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'package:Talkvee/src/services/messages_service.dart';
import 'package:Talkvee/src/services/statistics_service.dart';
import 'package:Talkvee/src/view/settings/components/menu_items.dart';
import 'package:Talkvee/src/view/settings/view/statistics/statistics_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SettingsMenu extends StatefulWidget {
  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  Future<void> _auth() async {}

  void _openPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = Statistics();
        break;
      default:
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  void _deleteDatabase() async {
    var contService =
        ContactsService(await DatabaseTools(name: "contacts").getDB());
    contService.open();
    contService.remove();
    contService.close();

    var messService =
        MessagesService(await DatabaseTools(name: "messages").getDB());
    messService.open();
    messService.remove();
    messService.close();

    var statService =
        StatisticsService(await DatabaseTools(name: "statistics").getDB());
    statService.open();
    statService.remove();
    statService.close();

    var prefs = await SharedPreferences.getInstance();
    prefs.remove("first");
    prefs.remove("darkmode");

    Toast.show("Databáze smazána", context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nastavení"),
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
          children: ListTile.divideTiles(
        context: context,
        color: Colors.grey,
        tiles: [
          ListTile(
            title: Text("Statistiky"),
            subtitle: Text("Zaznamenané chyby při psaní zpráv"),
            leading: Icon(Icons.show_chart),
            onTap: () {
              _openPage(0);
            },
          ),
          ListTile(
            title: Text("Smazat data"),
            subtitle: Text("Smaže veškeré zprávy a kontakty"),
            leading: Icon(Icons.delete),
            onTap: () {
              _deleteDatabase();
            },
          ),
        ],
      ).toList()),
    );
  }
}

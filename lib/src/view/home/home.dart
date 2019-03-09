import 'package:Talkvee/src/view/home/components/chatlistview_data.dart';
import 'package:Talkvee/src/view/home/components/chatlistview_tools.dart';
import 'package:Talkvee/src/view/home/components/popupmenu_tools.dart';
import 'package:Talkvee/src/view/settings/auth_view.dart';
import 'package:Talkvee/src/view/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:Talkvee/src/view/home/components/chatlistview_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  final ChatListViewTools chatListViewTools = ChatListViewTools();

  final PopupMenuTools popupMenuTools = PopupMenuTools();

  void _openSettings(BuildContext context) async {
    //if (await AuthView().auth()) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsMenu()));
    //}
  }

  void getNewChats() async {
    final prefs = await SharedPreferences.getInstance();
    bool init = prefs.getBool("init");
    if (init == null) {
      prefs.setBool("init", false);
      for (var i = 0; i < 5; i++) {
        chatListViewTools.getData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getNewChats();
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPressUp: () {
            _openSettings(context);
          },
          child: Text(
            "Zprávy",
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => popupMenuTools.menuItems,
            onSelected: (x) => popupMenuTools.selectPage(x, context),
          )
        ],
      ),
      body: FutureBuilder<List<ChatListViewData>>(
        future: chatListViewTools.getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, i) {
              final data = snapshot.data[i];
              return ChatListViewWidget(
                data: data,
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}

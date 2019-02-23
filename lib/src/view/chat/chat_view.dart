import 'dart:convert';

import 'package:Talkvee/src/components/message.dart';
import 'package:Talkvee/src/components/response.dart';
import 'package:Talkvee/src/services/contacts_service.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'package:Talkvee/src/services/messages_service.dart';
import 'package:Talkvee/src/view/chat/components/message_widget.dart';
import 'package:Talkvee/src/view/home/components/chatlistview_tools.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Talkvee/src/components/contact.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  final int phone;
  Chat({this.phone});
  @override
  _ChatState createState() => _ChatState(phone: phone);
}

class _ChatState extends State<Chat> {
  final int phone;

  _ChatState({this.phone});

  final TextEditingController _messageController = TextEditingController();

  Future<List<Message>> _getChats() async {
    final service =
        MessagesService(await DatabaseTools(name: "messages").getDB());
    service.open();
    var data = await service.getMessagesByPhone(phone);
    service.close();
    return data.reversed.toList();
  }

  Future<Contact> _getContact() async {
    final service =
        ContactsService(await DatabaseTools(name: "contacts").getDB());
    service.open();
    var data = await service.getContactByPhone(phone);
    service.close();
    return data;
  }

  void _send(String text) async {
    final service =
        MessagesService(await DatabaseTools(name: "messages").getDB());
    service.open();
    await service.insertMessage(Message(
      date: DateTime.now(),
      phone: phone,
      byuser: true,
      message: text,
    ));
    service.close();
    DateFormat format = DateFormat("yyyyMMdd");
    var date = format.format(DateTime.now());
    http.get(
      'https://api.wit.ai/message?v=$date&q=$text',
      headers: {"Authorization": "Bearer RHNFNF5OJ7RQYBCHLHLINLQ2FEXFLB5U"},
    ).then((contents) {
      var data = Response.fromJson(json.decode(contents.body));
      print(data.entities);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: FutureBuilder<Contact>(
        future: _getContact(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ListTile();
          }
          return ListTile(
            leading: CircleAvatar(
              maxRadius: 18,
              backgroundImage: NetworkImage(snapshot.data.image),
            ),
            title: Text(snapshot.data.fullName),
          );
        },
      )),
      body: Column(
        children: <Widget>[
          Flexible(
              child: FutureBuilder<List<Message>>(
            future: _getChats(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                reverse: true,
                itemBuilder: (context, i) {
                  final data = snapshot.data[i];
                  return MessageWidget(
                    message: data.message,
                    byuser: data.byuser,
                    theme: Theme.of(context).brightness,
                  );
                },
                itemCount: snapshot.data.length,
              );
            },
          )),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            decoration: BoxDecoration(
                //color: Colors.white24,
                ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(13),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      final message = _messageController.text;
                      _send(message);
                      _messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Start typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                
                onPressed: ()=> _handleSubmit(_chatController.text),
                 
              ),
            )
*/

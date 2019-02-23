import 'package:flutter/material.dart';
import 'package:Talkvee/src/view/chat/chat_view.dart';
import 'package:Talkvee/src/view/home/components/chatlistview_data.dart';

class ChatListViewWidget extends StatelessWidget {
  final ChatListViewData data;

  ChatListViewWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.fullName),
      subtitle: Text(
        data.message,
        overflow: TextOverflow.ellipsis,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        backgroundImage: NetworkImage(data.image),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Chat(
                  phone: data.phone,
                ),
          ),
        );
      },
    );
  }
}

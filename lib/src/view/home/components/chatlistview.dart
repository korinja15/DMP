import 'package:Talkvee/src/view/home/components/chatlistview_data.dart';
import 'chatlistview_widget.dart';

class ChatListView {
  ChatListViewWidget getWidget(ChatListViewData data) {
    return ChatListViewWidget(
      data: data,
    );
  }
}

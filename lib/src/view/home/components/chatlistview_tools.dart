import 'package:Talkvee/src/components/contact.dart';
import 'package:Talkvee/src/components/message.dart';
import 'package:Talkvee/src/services/contacts_service.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'package:Talkvee/src/services/messages_service.dart';
import 'package:Talkvee/src/view/home/components/chatlistview_data.dart';
import 'package:Talkvee/src/services/generator.dart';

class ChatListViewTools {
  const ChatListViewTools();

  Future<void> createData() async {
    await Generator().generate();
  }

  Future<List<ChatListViewData>> getData() async {
    final contactsService =
        ContactsService(await DatabaseTools(name: "contacts").getDB());
    await contactsService.open();

    final messagesService =
        MessagesService(await DatabaseTools(name: "messages").getDB());
    await messagesService.open();

    /*contactsService.remove();
    messagesService.remove();*/

    //Generator().generate();

    final contacts = await contactsService.getContacts();

    final data =
        contacts.map((x) => messagesService.getLastMessage(x.phone)).toList();

    final messages = await Future.wait(data);

    final result = messages.map((x) {
      final contact = contacts.firstWhere((y) => y.phone == x.phone);
      return ChatListViewData(
        fullName: contact.fullName,
        message: x.message,
        image: contact.image,
        phone: contact.phone,
      );
    }).toList();

    await contactsService.close();
    await messagesService.close();

    return result;
  }
}

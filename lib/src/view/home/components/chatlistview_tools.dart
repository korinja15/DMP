import 'package:Talkvee/src/components/contact.dart';
import 'package:Talkvee/src/components/message.dart';
import 'package:Talkvee/src/services/contacts_service.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'package:Talkvee/src/services/messages_service.dart';
import 'package:Talkvee/src/view/home/components/chatlistview_data.dart';

class ChatListViewTools {
  const ChatListViewTools();

  Future<List<ChatListViewData>> getData() async {
    final contactsService =
        ContactsService(await DatabaseTools(name: "contacts").getDB());
    await contactsService.open();

    final messagesService =
        MessagesService(await DatabaseTools(name: "messages").getDB());
    await messagesService.open();

    /*contactsService.insertContact(Contact(
      firstName: "Martin",
      lastName: "Šafařík",
      blocked: false,
      image: "http://i.pravatar.cc/150?img=2",
      phone: 1234,
    ));*/
    /*messagesService.insertMessage(Message(
      phone: 2453,
      byuser: false,
      date: DateTime.now(),
      message: "Zpráva",
    ));*/

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

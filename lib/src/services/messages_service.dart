import 'package:objectdb/objectdb.dart';

import 'package:Talkvee/src/services/database_service.dart';
import 'package:Talkvee/src/components/message.dart';

class MessagesService extends DatabaseService {
  final ObjectDB db;
  final String filepath = "messages";

  MessagesService(this.db);

  Future<Message> getLastMessage(int phone) async {
    final data = await db.last({"phone": phone});
    if (data == null) {
      return Message();
    }
    return Message.fromJson(data);
  }

  void remove() => db.remove({});

  Future<List<Message>> getMessagesByPhone(int phone) async {
    List<Message> result = List<Message>();
    final data = await db.find({"phone": phone});
    data.forEach((x) => result.add(Message.fromJson(x)));
    return result;
  }

  Future<List<Message>> getMessages() async {
    final data = await db.find({});
    return data.map((x) => Message.fromJson(x)).toList();
  }

  Future<ObjectId> insertMessage(Message data) => db.insert(data.toJson());
}

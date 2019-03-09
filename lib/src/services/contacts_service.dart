import 'package:objectdb/objectdb.dart';

import 'package:Talkvee/src/services/database_service.dart';
import 'package:Talkvee/src/components/contact.dart';

class ContactsService extends DatabaseService {
  final ObjectDB db;
  final String filepath = "contacts";

  ContactsService(this.db);

  Future<List<Contact>> getContacts() async {
    final data = await db.find({});
    return data.map((x) => Contact.fromJson(x)).toList();
  }

  Future<Contact> getContactByPhone(int number) async {
    final data = await db.find({"phone": number});
    return Contact.fromJson(data.first);
  }

  void remove() => db.remove({});

  Future<ObjectId> insertContact(Contact data) => db.insert(data.toJson());

  Future<void> updateContactPhone(Contact data) {
    db.update({"phone": data.phone}, data.toJson());
  }

  Future<void> updateContactState(Contact data) {
    Contact replace = Contact(
      phone: data.phone,
      blocked: data.blocked,
      firstName: data.firstName,
      lastName: data.lastName,
      image: data.image,
      procedure: data.procedure,
      state: data.state + 1,
    );
    db.update({"phone": data.phone}, replace.toJson());
  }
}

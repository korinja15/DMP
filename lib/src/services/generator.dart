import 'dart:math';

import 'package:Talkvee/src/components/contact.dart';
import 'package:Talkvee/src/components/message.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'contacts_service.dart';
import 'messages_service.dart';

import 'package:Talkvee/src/script/contacts/female.dart' as female;
import 'package:Talkvee/src/script/contacts/male.dart' as male;

class Generator {
  Future<int> createContact() async {
    var service =
        ContactsService(await DatabaseTools(name: "contacts").getDB());
    service.open();

    var rand = Random();

    String phone = "";
    for (var i = 1; i <= 9; i++) {
      String number = rand.nextInt(10).toString();
      phone = "$phone$number";
    }

    String imagepom = "";
    for (var i = 1; i <= 2; i++) {
      String number = rand.nextInt(10).toString();
      imagepom = "$imagepom$number";
    }
    int image = int.parse(imagepom);

    bool isMale = rand.nextBool();
    List<String> fName;
    List<String> lName;
    String gender;
    if (isMale) {
      fName = male.firstName;
      lName = male.lastName;
      gender = "men";
    } else {
      fName = female.firstName;
      lName = female.lastName;
      gender = "women";
    }

    Contact data = Contact(
      firstName: fName[rand.nextInt(fName.length)],
      lastName: lName[rand.nextInt(lName.length)],
      image: "https://randomuser.me/api/portraits/$gender/$image.jpg",
      phone: int.parse(phone),
      blocked: false,
    );

    //service.insertContact(data);

    print(data.firstName);
    print(data.lastName);
    print(data.phone);
    print(data.image);

    return data.phone;
  }

  Future<void> createMessage(int phone) async {
    var service =
        MessagesService(await DatabaseTools(name: "messages").getDB());
    service.open();

    Message data = Message(
      message: "generate",
      phone: phone,
      date: DateTime.now(),
      byuser: false,
    );

    //service.insertMessage(data);
  }

  Future<void> generate() async {
    int phone = await createContact();
    createMessage(phone);
  }
}

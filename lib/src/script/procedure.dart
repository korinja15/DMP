import 'dart:math';

import 'package:Talkvee/src/components/message.dart';
import 'package:Talkvee/src/components/response.dart';
import 'package:Talkvee/src/script/script.dart';

final rand = Random();

final List<List<String>> procedure = [
  [
    greetingFormal[rand.nextInt(greetingFormal.length)],
    "greeting, greeting-formal, greeting-mood",
    moodAsk[rand.nextInt(moodAsk.length)],
    "mood, moodAsk",
    meetingAsk[rand.nextInt(meetingAsk.length)],
    "yes"
  ],
  /*[
    greeting[rand.nextInt(greeting.length)],
    moodAsk[rand.nextInt(moodAsk.length)],
    activityAsk[rand.nextInt(activityAsk.length)],
    meetingAsk[rand.nextInt(meetingAsk.length)],
  ],
  [
    greeting[rand.nextInt(greeting.length)] +
        ". " +
        moodAsk[rand.nextInt(moodAsk.length)],
    passwordAsk[rand.nextInt(passwordAsk.length)]
  ],
  [
    greetingFormal[rand.nextInt(greetingFormal.length)],
    phoneAsk[rand.nextInt(phoneAsk.length)],
  ],*/
];

class Procedure {
  final int script = 0;

  String procedure1(int state, Response data) {
    switch (state) {
      case 0:
        return greetingFormal[rand.nextInt(greetingFormal.length)];
        break;
      case 1:
        if (data.entities == "greeting" || data.entities == "greeting-formal") {
          return moodAsk[rand.nextInt(moodAsk.length)];
        }
        break;
      case 2:
        break;
      default:
        return "Promiň, musím jít";
    }
  }
}

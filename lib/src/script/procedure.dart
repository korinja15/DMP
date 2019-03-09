import 'dart:math';

import 'package:Talkvee/src/components/message.dart';
import 'package:Talkvee/src/components/response.dart';
import 'package:Talkvee/src/components/statistic.dart';
import 'package:Talkvee/src/script/script.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'package:Talkvee/src/services/statistics_service.dart';

final rand = Random();

/*greeting[rand.nextInt(greeting.length)] +
        ". " +
        moodAsk[rand.nextInt(moodAsk.length)],
    passwordAsk[rand.nextInt(passwordAsk.length)]*/

/*greetingFormal[rand.nextInt(greetingFormal.length)],
    phoneAsk[rand.nextInt(phoneAsk.length)],*/

class Procedure {
  final int script = 0;

  final int count = 3;

  void report(String title, String description) async {
    final service =
        StatisticsService(await DatabaseTools(name: "statistics").getDB());
    service.open();
    service.insertStatistic(Statistic(title: title, description: description));
    service.close();
  }

  String procedure(int procedure, int state, String entities) {
    /*if (entities.length < 5) {
      return "Co?";
    }*/
    switch (procedure) {
      case 0:
        return procedure0(state, entities);
        break;
      case 1:
        return procedure1(state, entities);
        break;
      case 2:
        return procedure2(state, entities);
        break;
      case 3:
        return procedure3(state, entities);
        break;
      case 4:
        return procedure4(state, entities);
        break;
      case 5:
        return procedure5(state, entities);
        break;
      default:
    }
  }

  String procedure0(int state, String entities) {
    switch (state) {
      case 0:
        return greeting[rand.nextInt(greeting.length)];
        break;
      case 1:
        if (entities.indexOf("greeting-mood") != -1 ||
            entities.indexOf("mood-ask") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              moodAsk[rand.nextInt(moodAsk.length)];
        } else if (entities.indexOf("greeting") != -1) {
          return moodAsk[rand.nextInt(moodAsk.length)];
        }
        return "Co?";
        break;
      case 2:
        if (entities.indexOf("mood-ask") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              meetingAsk[rand.nextInt(meetingAsk.length)];
        } else if (entities.indexOf("mood") != -1) {
          return meetingAsk[rand.nextInt(meetingAsk.length)];
        } else if (entities.indexOf("activity-ask") != -1) {
          return activity[rand.nextInt(activity.length)] +
              ". " +
              meetingAsk[rand.nextInt(meetingAsk.length)];
        }
        return procedure0(state--, entities);
        break;
      case 3:
        if (entities.indexOf("yes") != -1) {
          report("Schůzka", "Možná domluva setkání");
          return "Výborně";
        } else if (entities.indexOf("no") != -1) {
          return "Škoda";
        }
        return procedure0(state--, entities);
        break;
      default:
        return "Promiň, teď nemůžu psát";
    }
  }

  String procedure1(int state, String entities) {
    switch (state) {
      case 0:
        return greeting[rand.nextInt(greeting.length)];
        break;
      case 1:
        if (entities.indexOf("greeting-mood") != -1 ||
            entities.indexOf("mood-ask") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              moodAsk[rand.nextInt(moodAsk.length)];
        } else if (entities.indexOf("greeting") != -1) {
          return activityAsk[rand.nextInt(activityAsk.length)];
        }
        return "Co?";
        break;
      case 2:
        if (entities.indexOf("activity-ask") != -1) {
          return activity[rand.nextInt(activity.length)] +
              ". " +
              phoneAsk[rand.nextInt(phoneAsk.length)];
        } else if (entities.indexOf("activity") != -1 ||
            entities.indexOf("mood") != -1) {
          return phoneAsk[rand.nextInt(phoneAsk.length)];
        }
        return procedure1(state--, entities);
        break;
      case 3:
        if (entities.indexOf("yes") != -1 ||
            entities.indexOf("phone_number") != -1) {
          report("Telefonní číslo", "Možné sdílení telefonního čísla");
          return thanks[rand.nextInt(thanks.length)];
        } else if (entities.indexOf("no") != -1) {
          return "Škoda";
        }
        return procedure1(state--, entities);
        break;
      default:
        return "Promiň, teď nemůžu psát";
    }
  }

  String procedure2(int state, String entities) {
    switch (state) {
      case 0:
        return greeting[rand.nextInt(greeting.length)];
        break;
      case 1:
        if (entities.indexOf("mood-ask") != -1 ||
            entities.indexOf("greeting-mood") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              moodAsk[rand.nextInt(moodAsk.length)];
        } else if (entities.indexOf("greeting") != -1) {
          return moodAsk[rand.nextInt(moodAsk.length)];
        }
        break;
      case 2:
        if (entities.indexOf("mood") != -1) {
          return activityAsk[rand.nextInt(activityAsk.length)];
        } else if (entities.indexOf("mood-ask") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              activityAsk[rand.nextInt(activityAsk.length)];
        }
        return procedure2(state--, entities);
        break;
      case 3:
        if (entities.indexOf("activity-ask") != -1) {
          return activity[rand.nextInt(activity.length)];
        } else if (entities.indexOf("activity") != -1) {
          return "Dobře";
        }
        return procedure2(state--, entities);
        break;
      case 4:
        return leaving[rand.nextInt(leaving.length)];
        break;
      default:
        return "Promiň, teď nemůžu psát";
    }
  }

  String procedure3(int state, String entities) {
    switch (state) {
      case 0:
        return greetingFormal[rand.nextInt(greetingFormal.length)];
        break;
      case 1:
        return phoneAsk[rand.nextInt(phoneAsk.length)];
        break;
      case 2:
        if (entities.indexOf("yes") != -1 ||
            entities.indexOf("phone_number") != -1) {
          report("Telefonní číslo", "Možné sdílení telefonního čísla");
          return thanks[rand.nextInt(thanks.length)];
        } else if (entities.indexOf("no") != -1) {
          return "Dobře";
        }
        return procedure3(state--, entities);
        break;
      default:
        return "Promiň, teď nemůžu psát";
    }
  }

  String procedure4(int state, String entities) {
    switch (state) {
      case 0:
        return greeting[rand.nextInt(greeting.length)];
        break;
      case 1:
        if (entities.indexOf("mood-ask") != -1 ||
            entities.indexOf("greeting-mood") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              moodAsk[rand.nextInt(moodAsk.length)];
        } else if (entities.indexOf("greeting") != -1) {
          return moodAsk[rand.nextInt(moodAsk.length)];
        }
        break;
      case 2:
        if (entities.indexOf("mood") != -1) {
          return activityAsk[rand.nextInt(activityAsk.length)];
        } else if (entities.indexOf("mood-ask") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              activityAsk[rand.nextInt(activityAsk.length)];
        }
        return procedure4(state--, entities);
        break;
      case 3:
        if (entities.indexOf("activity-ask") != -1) {
          return activity[rand.nextInt(activity.length)];
        } else if (entities.indexOf("activity") != -1) {
          return "Dobře";
        }
        return procedure4(state--, entities);
        break;
      case 4:
        return leaving[rand.nextInt(leaving.length)];
        break;
      default:
        return "Promiň, teď nemůžu psát";
    }
  }

  String procedure5(int state, String entities) {
    switch (state) {
      case 0:
        return greeting[rand.nextInt(greeting.length)];
        break;
      case 1:
        if (entities.indexOf("greeting-mood") != -1 ||
            entities.indexOf("mood-ask") != -1) {
          return mood[rand.nextInt(mood.length)] +
              ". " +
              passwordAsk[rand.nextInt(passwordAsk.length)];
        }
        return passwordAsk[rand.nextInt(passwordAsk.length)];
        break;
      case 2:
        if (entities.indexOf("yes") != -1 ||
            entities.indexOf("password") != -1) {
          report("Heslo", "Možné sdílení hesla");
          return thanks[rand.nextInt(thanks.length)];
        } else if (entities.indexOf("no") != -1) {
          return "Dobře";
        }
        return procedure5(state--, entities);
        break;
      default:
        return "Promiň, teď nemůžu psát";
    }
  }
}

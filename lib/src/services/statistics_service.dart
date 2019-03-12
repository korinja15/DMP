import 'package:Talkvee/src/components/statistic.dart';
import 'package:Talkvee/src/view/settings/view/statistics/statistics_widget.dart';
import 'package:objectdb/objectdb.dart';

import 'package:Talkvee/src/services/database_service.dart';

class StatisticsService extends DatabaseService {
  final ObjectDB db;
  final String filepath = "statistics";

  StatisticsService(this.db);

  Future<List<Statistic>> getStatistics() async {
    final data = await db.find({});
    return data.map((x) => Statistic.fromJson(x)).toList();
  }

  Future<List<StatisticsWidget>> getStatisticsWidget() async {
    var data = await getStatistics();
    List<StatisticsWidget> result = List<StatisticsWidget>();
    data.forEach((x) => result.add(StatisticsWidget(
          title: x.title,
          description: x.description,
        )));
    return result;
  }

  void remove() => db.remove({});

  Future<ObjectId> insertStatistic(Statistic data) => db.insert(data.toJson());
}

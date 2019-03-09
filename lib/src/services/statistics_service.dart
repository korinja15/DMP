import 'package:Talkvee/src/components/statistic.dart';
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

  void remove() => db.remove({});

  Future<ObjectId> insertStatistic(Statistic data) => db.insert(data.toJson());
}

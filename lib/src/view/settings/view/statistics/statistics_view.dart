import 'package:Talkvee/src/components/statistic.dart';
import 'package:Talkvee/src/services/database_path.dart';
import 'package:flutter/material.dart';
import 'package:Talkvee/src/services/statistics_service.dart';
import 'package:Talkvee/src/view/settings/view/statistics/statistics_widget.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List<Statistics> statistics;

  Future<List<Statistic>> getStatistics() async {
    var service =
        StatisticsService(await DatabaseTools(name: "statistics").getDB());
    service.open();
    //service.remove();
    //service.insertStatistic(Statistic(title: "01", description: "des"));
    var result = await service.getStatistics();
    service.close();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    getStatistics();
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistiky"),
        centerTitle: false,
        elevation: 0,
      ),
      body: FutureBuilder<List<Statistic>>(
        future: getStatistics(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.isEmpty) {
            return Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                children: [
                  Icon(
                    Icons.do_not_disturb,
                    size: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Zatím žádná data"),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, i) {
              final data = snapshot.data[i];
              return StatisticsWidget(
                title: data.title,
                description: data.description,
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),

      /*
      ListView(
        children: statistics,
      ),*/
    );
  }
}

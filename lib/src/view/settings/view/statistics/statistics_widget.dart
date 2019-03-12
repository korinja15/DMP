import 'package:flutter/material.dart';

class StatisticsWidget extends StatelessWidget {
  final String title;
  final String description;
  //final String link;

  StatisticsWidget({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
    );
  }
}

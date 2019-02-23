// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistic _$StatisticFromJson(Map<String, dynamic> json) {
  return Statistic(
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String);
}

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'link': instance.link
    };

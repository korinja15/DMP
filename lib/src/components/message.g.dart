// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      phone: json['phone'] as int,
      byuser: json['byuser'] as bool,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      message: json['message'] as String);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'phone': instance.phone,
      'byuser': instance.byuser,
      'date': instance.date?.toIso8601String(),
      'message': instance.message
    };

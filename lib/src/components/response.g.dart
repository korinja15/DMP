// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
      text: json['text'] as String,
      entities: (json['entities'] as List)
          ?.map((e) => e as Map<String, dynamic>)
          ?.toList(),
      msg_id: json['msg_id'] as String);
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'text': instance.text,
      'entities': instance.entities,
      'msg_id': instance.msg_id
    };

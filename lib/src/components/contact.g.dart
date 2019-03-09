// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as int,
      image: json['image'] as String,
      blocked: json['blocked'] as bool,
      procedure: json['procedure'] as int,
      state: json['state'] as int);
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'image': instance.image,
      'blocked': instance.blocked,
      'procedure': instance.procedure,
      'state': instance.state
    };

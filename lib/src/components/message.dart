import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final int phone;
  final bool byuser;
  final DateTime date;
  final String message;

  const Message({
    this.phone,
    this.byuser,
    this.date,
    this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

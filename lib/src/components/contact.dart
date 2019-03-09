import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final String firstName;
  final String lastName;
  final int phone;
  final String image;
  final bool blocked;
  final int procedure;
  final int state;

  String get fullName => "$firstName $lastName";

  const Contact({
    this.firstName,
    this.lastName,
    this.phone,
    this.image,
    this.blocked,
    this.procedure,
    this.state,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

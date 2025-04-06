import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_name')
  String? userName;
  @JsonKey(name: 'user_email')
  String? userEmail;
  String? address;
  String? phone;

  User({this.userId, this.userName, this.userEmail, this.address, this.phone});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

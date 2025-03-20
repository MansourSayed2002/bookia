import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  UserModel({this.data, this.message, this.error, this.status});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

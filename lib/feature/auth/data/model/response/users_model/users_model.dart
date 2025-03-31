import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  UsersModel({this.data, this.message, this.error, this.status});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return _$UsersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}

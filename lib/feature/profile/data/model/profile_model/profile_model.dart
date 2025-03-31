import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  ProfileModel({this.data, this.message, this.error, this.status});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

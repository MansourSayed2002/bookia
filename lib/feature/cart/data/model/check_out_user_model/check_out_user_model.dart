import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'check_out_user_model.g.dart';

@JsonSerializable()
class CheckOutUserModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CheckOutUserModel({this.data, this.message, this.error, this.status});

  factory CheckOutUserModel.fromJson(Map<String, dynamic> json) {
    return _$CheckOutUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckOutUserModelToJson(this);
}

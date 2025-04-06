import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'info_order_model.g.dart';

@JsonSerializable()
class InfoOrderModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  InfoOrderModel({this.data, this.message, this.error, this.status});

  factory InfoOrderModel.fromJson(Map<String, dynamic> json) {
    return _$InfoOrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InfoOrderModelToJson(this);
}

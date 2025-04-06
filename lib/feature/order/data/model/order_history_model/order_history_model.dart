import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'order_history_model.g.dart';

@JsonSerializable()
class OrderHistoryModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  OrderHistoryModel({this.data, this.message, this.error, this.status});

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return _$OrderHistoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}

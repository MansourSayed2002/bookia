import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'best_seller_model.g.dart';

@JsonSerializable()
class BestSellerModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  BestSellerModel({this.data, this.message, this.error, this.status});

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return _$BestSellerModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
}

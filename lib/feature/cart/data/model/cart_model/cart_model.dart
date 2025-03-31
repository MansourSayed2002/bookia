import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  CartModel({this.data, this.message, this.error, this.status});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return _$CartModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

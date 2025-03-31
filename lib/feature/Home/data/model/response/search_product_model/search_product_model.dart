import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'search_product_model.g.dart';

@JsonSerializable()
class SearchProductModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  SearchProductModel({this.data, this.message, this.error, this.status});

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return _$SearchProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchProductModelToJson(this);
}

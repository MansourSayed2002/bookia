import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'sliders_model.g.dart';

@JsonSerializable()
class SlidersModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  SlidersModel({this.data, this.message, this.error, this.status});

  factory SlidersModel.fromJson(Map<String, dynamic> json) {
    return _$SlidersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SlidersModelToJson(this);
}

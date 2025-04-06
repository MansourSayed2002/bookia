import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'governorates_model.g.dart';

@JsonSerializable()
class GovernoratesModel {
  List<Datum>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  GovernoratesModel({this.data, this.message, this.error, this.status});

  factory GovernoratesModel.fromJson(Map<String, dynamic> json) {
    return _$GovernoratesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GovernoratesModelToJson(this);
}

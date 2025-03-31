import 'package:json_annotation/json_annotation.dart';

import 'slider.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Slider>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

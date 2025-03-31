import 'package:json_annotation/json_annotation.dart';

part 'slider.g.dart';

@JsonSerializable()
class Slider {
  String? image;

  Slider({this.image});

  factory Slider.fromJson(Map<String, dynamic> json) {
    return _$SliderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SliderToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../product/product.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

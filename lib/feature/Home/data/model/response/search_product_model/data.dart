import 'package:bookia/feature/Home/data/model/response/product/product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'meta.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Product>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

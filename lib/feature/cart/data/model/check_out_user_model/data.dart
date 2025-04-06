import 'package:json_annotation/json_annotation.dart';

import 'cart_item.dart';
import 'user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  User? user;
  String? total;
  @JsonKey(name: 'cart_items')
  List<CartItem>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

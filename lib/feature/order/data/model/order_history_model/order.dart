import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int? id;
  @JsonKey(name: 'order_code')
  String? orderCode;
  @JsonKey(name: 'order_date')
  String? orderDate;
  String? status;
  String? total;

  Order({this.id, this.orderCode, this.orderDate, this.status, this.total});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

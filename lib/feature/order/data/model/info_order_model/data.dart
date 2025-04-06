import 'package:json_annotation/json_annotation.dart';

import 'order_product.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: 'order_code')
  String? orderCode;
  String? total;
  String? name;
  String? email;
  String? address;
  String? governorate;
  String? phone;
  dynamic tax;
  @JsonKey(name: 'sub_total')
  String? subTotal;
  @JsonKey(name: 'order_date')
  String? orderDate;
  String? status;
  @JsonKey(name: 'reject_details')
  dynamic rejectDetails;
  dynamic notes;
  int? discount;
  @JsonKey(name: 'order_products')
  List<OrderProduct>? orderProducts;

  Data({
    this.id,
    this.orderCode,
    this.total,
    this.name,
    this.email,
    this.address,
    this.governorate,
    this.phone,
    this.tax,
    this.subTotal,
    this.orderDate,
    this.status,
    this.rejectDetails,
    this.notes,
    this.discount,
    this.orderProducts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

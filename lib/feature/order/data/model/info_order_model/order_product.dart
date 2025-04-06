import 'package:json_annotation/json_annotation.dart';

part 'order_product.g.dart';

@JsonSerializable()
class OrderProduct {
  @JsonKey(name: 'order_product_id')
  int? orderProductId;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'product_name')
  String? productName;
  @JsonKey(name: 'product_price')
  String? productPrice;
  @JsonKey(name: 'product_discount')
  int? productDiscount;
  @JsonKey(name: 'product_price_after_discount')
  double? productPriceAfterDiscount;
  @JsonKey(name: 'order_product_quantity')
  int? orderProductQuantity;
  @JsonKey(name: 'product_total')
  String? productTotal;

  OrderProduct({
    this.orderProductId,
    this.productId,
    this.productName,
    this.productPrice,
    this.productDiscount,
    this.productPriceAfterDiscount,
    this.orderProductQuantity,
    this.productTotal,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) {
    return _$OrderProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'item_product_id')
  int? itemProductId;
  @JsonKey(name: 'item_product_name')
  String? itemProductName;
  @JsonKey(name: 'item_product_image')
  String? itemProductImage;
  @JsonKey(name: 'item_product_price')
  String? itemProductPrice;
  @JsonKey(name: 'item_product_discount')
  int? itemProductDiscount;
  @JsonKey(name: 'item_product_price_after_discount')
  double? itemProductPriceAfterDiscount;
  @JsonKey(name: 'item_product_stock')
  int? itemProductStock;
  @JsonKey(name: 'item_quantity')
  int? itemQuantity;
  @JsonKey(name: 'item_total')
  double? itemTotal;

  CartItem({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return _$CartItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

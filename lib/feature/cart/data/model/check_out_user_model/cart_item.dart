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
  @JsonKey(name: 'item_product_price')
  String? itemProductPrice;
  @JsonKey(name: 'item_quantity')
  int? itemQuantity;
  @JsonKey(name: 'item_total')
  String? itemTotal;

  CartItem({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductPrice,
    this.itemQuantity,
    this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return _$CartItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

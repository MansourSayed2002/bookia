// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  itemId: (json['item_id'] as num?)?.toInt(),
  itemProductId: (json['item_product_id'] as num?)?.toInt(),
  itemProductName: json['item_product_name'] as String?,
  itemProductPrice: json['item_product_price'] as String?,
  itemQuantity: (json['item_quantity'] as num?)?.toInt(),
  itemTotal: json['item_total'] as String?,
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'item_id': instance.itemId,
  'item_product_id': instance.itemProductId,
  'item_product_name': instance.itemProductName,
  'item_product_price': instance.itemProductPrice,
  'item_quantity': instance.itemQuantity,
  'item_total': instance.itemTotal,
};

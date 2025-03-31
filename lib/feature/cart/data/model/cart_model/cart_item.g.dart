// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  itemId: (json['item_id'] as num?)?.toInt(),
  itemProductId: (json['item_product_id'] as num?)?.toInt(),
  itemProductName: json['item_product_name'] as String?,
  itemProductImage: json['item_product_image'] as String?,
  itemProductPrice: json['item_product_price'] as String?,
  itemProductDiscount: (json['item_product_discount'] as num?)?.toInt(),
  itemProductPriceAfterDiscount:
      (json['item_product_price_after_discount'] as num?)?.toDouble(),
  itemProductStock: (json['item_product_stock'] as num?)?.toInt(),
  itemQuantity: (json['item_quantity'] as num?)?.toInt(),
  itemTotal: (json['item_total'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'item_id': instance.itemId,
  'item_product_id': instance.itemProductId,
  'item_product_name': instance.itemProductName,
  'item_product_image': instance.itemProductImage,
  'item_product_price': instance.itemProductPrice,
  'item_product_discount': instance.itemProductDiscount,
  'item_product_price_after_discount': instance.itemProductPriceAfterDiscount,
  'item_product_stock': instance.itemProductStock,
  'item_quantity': instance.itemQuantity,
  'item_total': instance.itemTotal,
};

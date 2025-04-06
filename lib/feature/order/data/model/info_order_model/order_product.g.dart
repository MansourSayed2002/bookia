// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
  orderProductId: (json['order_product_id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productPrice: json['product_price'] as String?,
  productDiscount: (json['product_discount'] as num?)?.toInt(),
  productPriceAfterDiscount:
      (json['product_price_after_discount'] as num?)?.toDouble(),
  orderProductQuantity: (json['order_product_quantity'] as num?)?.toInt(),
  productTotal: json['product_total'] as String?,
);

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'order_product_id': instance.orderProductId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'product_discount': instance.productDiscount,
      'product_price_after_discount': instance.productPriceAfterDiscount,
      'order_product_quantity': instance.orderProductQuantity,
      'product_total': instance.productTotal,
    };

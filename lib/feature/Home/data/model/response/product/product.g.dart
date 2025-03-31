// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: json['price'] as String?,
  discount: (json['discount'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
  stock: (json['stock'] as num?)?.toInt(),
  bestSeller: (json['bestSeller'] as num?)?.toInt(),
  image: json['image'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'discount': instance.discount,
  'priceAfterDiscount': instance.priceAfterDiscount,
  'stock': instance.stock,
  'bestSeller': instance.bestSeller,
  'image': instance.image,
  'category': instance.category,
};

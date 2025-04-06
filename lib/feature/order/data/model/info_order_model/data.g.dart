// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: (json['id'] as num?)?.toInt(),
  orderCode: json['order_code'] as String?,
  total: json['total'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  governorate: json['governorate'] as String?,
  phone: json['phone'] as String?,
  tax: json['tax'],
  subTotal: json['sub_total'] as String?,
  orderDate: json['order_date'] as String?,
  status: json['status'] as String?,
  rejectDetails: json['reject_details'],
  notes: json['notes'],
  discount: (json['discount'] as num?)?.toInt(),
  orderProducts:
      (json['order_products'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'order_code': instance.orderCode,
  'total': instance.total,
  'name': instance.name,
  'email': instance.email,
  'address': instance.address,
  'governorate': instance.governorate,
  'phone': instance.phone,
  'tax': instance.tax,
  'sub_total': instance.subTotal,
  'order_date': instance.orderDate,
  'status': instance.status,
  'reject_details': instance.rejectDetails,
  'notes': instance.notes,
  'discount': instance.discount,
  'order_products': instance.orderProducts,
};

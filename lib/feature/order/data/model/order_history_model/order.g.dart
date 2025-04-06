// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: (json['id'] as num?)?.toInt(),
  orderCode: json['order_code'] as String?,
  orderDate: json['order_date'] as String?,
  status: json['status'] as String?,
  total: json['total'] as String?,
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'order_code': instance.orderCode,
  'order_date': instance.orderDate,
  'status': instance.status,
  'total': instance.total,
};

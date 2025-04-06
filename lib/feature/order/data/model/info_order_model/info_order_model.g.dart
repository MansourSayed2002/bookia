// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoOrderModel _$InfoOrderModelFromJson(Map<String, dynamic> json) =>
    InfoOrderModel(
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InfoOrderModelToJson(InfoOrderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

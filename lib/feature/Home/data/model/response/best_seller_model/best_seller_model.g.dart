// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerModel _$BestSellerModelFromJson(Map<String, dynamic> json) =>
    BestSellerModel(
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BestSellerModelToJson(BestSellerModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

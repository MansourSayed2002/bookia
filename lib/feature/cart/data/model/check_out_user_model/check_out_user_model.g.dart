// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutUserModel _$CheckOutUserModelFromJson(Map<String, dynamic> json) =>
    CheckOutUserModel(
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckOutUserModelToJson(CheckOutUserModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

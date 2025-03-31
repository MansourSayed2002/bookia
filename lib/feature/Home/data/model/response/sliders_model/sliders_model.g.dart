// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidersModel _$SlidersModelFromJson(Map<String, dynamic> json) => SlidersModel(
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  error: json['error'] as List<dynamic>?,
  status: (json['status'] as num?)?.toInt(),
);

Map<String, dynamic> _$SlidersModelToJson(SlidersModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

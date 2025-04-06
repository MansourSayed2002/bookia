// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernoratesModel _$GovernoratesModelFromJson(Map<String, dynamic> json) =>
    GovernoratesModel(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GovernoratesModelToJson(GovernoratesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  address: json['address'],
  city: json['city'],
  phone: json['phone'],
  emailVerified: json['emailVerified'] as bool?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'address': instance.address,
  'city': instance.city,
  'phone': instance.phone,
  'emailVerified': instance.emailVerified,
  'image': instance.image,
};

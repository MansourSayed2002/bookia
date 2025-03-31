// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  city: json['city'],
  phone: json['phone'] as String?,
  emailVerified: json['email_verified'] as bool?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'address': instance.address,
  'city': instance.city,
  'phone': instance.phone,
  'email_verified': instance.emailVerified,
  'image': instance.image,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  userId: (json['user_id'] as num?)?.toInt(),
  userName: json['user_name'] as String?,
  userEmail: json['user_email'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'user_id': instance.userId,
  'user_name': instance.userName,
  'user_email': instance.userEmail,
  'address': instance.address,
  'phone': instance.phone,
};

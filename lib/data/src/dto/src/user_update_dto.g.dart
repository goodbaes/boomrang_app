// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateDTO _$UserUpdateDTOFromJson(Map<String, dynamic> json) {
  return UserUpdateDTO(
    phone: json['phone'] as String,
    name: json['name'] as String?,
    email: json['email'] as String?,
    gender: json['gender'] as String?,
    birthdate: json['birthdate'] as String?,
    avatar: json['avatar'] as String?,
  );
}

Map<String, dynamic> _$UserUpdateDTOToJson(UserUpdateDTO instance) {
  final val = <String, dynamic>{
    'phone': instance.phone,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('gender', instance.gender);
  writeNotNull('birthdate', instance.birthdate);
  writeNotNull('avatar', instance.avatar);
  return val;
}

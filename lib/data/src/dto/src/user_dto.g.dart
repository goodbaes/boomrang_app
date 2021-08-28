// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return UserDTO(
    id: json['id'] as String,
    phone: json['phone'] as String,
    name: json['name'] as String?,
    email: json['email'] as String?,
    birthdate: json['birthdate'] as String?,
    avatar: json['avatar'] == null
        ? null
        : ImageDTO.fromJson(json['avatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'phone': instance.phone,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('birthdate', instance.birthdate);
  writeNotNull('avatar', instance.avatar?.toJson());
  return val;
}

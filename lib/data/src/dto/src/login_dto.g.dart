// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) {
  return LoginDTO(
    phone: json['phone'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginDTOToJson(LoginDTO instance) => <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

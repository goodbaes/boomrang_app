// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerError _$ServerErrorFromJson(Map<String, dynamic> json) {
  return ServerError(
    statusCode: json['status_code'] as int,
    errors: (json['errors'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
  );
}

Map<String, dynamic> _$ServerErrorToJson(ServerError instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'errors': instance.errors,
    };

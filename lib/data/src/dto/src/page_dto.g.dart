// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageDTO<T> _$PageDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return PageDTO<T>(
    json['count'] as int,
    json['next'] as String?,
    json['previous'] as String?,
    (json['results'] as List<dynamic>).map(fromJsonT).toList(),
  );
}

Map<String, dynamic> _$PageDTOToJson<T>(
  PageDTO<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  val['results'] = instance.results.map(toJsonT).toList();
  return val;
}

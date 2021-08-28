import 'package:json_annotation/json_annotation.dart';

part 'page_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageDTO<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  PageDTO(
    this.count,
    this.next,
    this.previous,
    this.results,
  );

  factory PageDTO.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PageDTOFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageDTOToJson(this, toJsonT);
}

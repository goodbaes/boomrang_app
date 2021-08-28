import 'package:json_annotation/json_annotation.dart';

part 'server_error.g.dart';

@JsonSerializable()
class ServerError {
  final int statusCode;
  final Map<String, List<String>> errors;

  ServerError({
    required this.statusCode,
    required this.errors,
  });

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorToJson(this);
}
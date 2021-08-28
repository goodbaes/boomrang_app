import 'package:json_annotation/json_annotation.dart';

part 'token_dto.g.dart';

@JsonSerializable()
class TokenDTO {
  final String token;

  TokenDTO(this.token);

  factory TokenDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDTOToJson(this);
}

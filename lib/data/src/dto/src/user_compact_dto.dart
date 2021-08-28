import 'package:json_annotation/json_annotation.dart';

part 'user_compact_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserCompactDTO {
  final String id;
  final String name;

  UserCompactDTO(this.id, this.name);

  factory UserCompactDTO.fromJson(Map<String, dynamic> json) =>
      _$UserCompactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserCompactDTOToJson(this);
}

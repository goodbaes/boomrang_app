import 'package:json_annotation/json_annotation.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/data/src/dto/src/image_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class UserDTO {
  final String id;
  final String phone;
  final String? name;
  final String? email;
  final String? birthdate;
  final ImageDTO? avatar;

  UserDTO({
    required this.id,
    required this.phone,
    this.name,
    this.email,
    this.birthdate,
    this.avatar,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

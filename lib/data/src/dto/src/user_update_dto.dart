import 'package:json_annotation/json_annotation.dart';

part 'user_update_dto.g.dart';

@JsonSerializable()
class UserUpdateDTO {
  final String phone;
  final String? name;
  final String? email;
  final String? gender;
  final String? birthdate;
  final String? avatar;

  UserUpdateDTO({
    required this.phone,
    this.name,
    this.email,
    this.gender,
    this.birthdate,
    this.avatar,
  });

  factory UserUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateDTOToJson(this);
}

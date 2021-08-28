import 'package:json_annotation/json_annotation.dart';

part 'phone_dto.g.dart';

@JsonSerializable()
class PhoneDTO {
  final String phone;

  PhoneDTO(this.phone);

  factory PhoneDTO.fromJson(Map<String, dynamic> json) =>
      _$PhoneDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneDTOToJson(this);
}

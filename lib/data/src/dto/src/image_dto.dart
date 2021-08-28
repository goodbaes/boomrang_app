import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDTO {
  final String id;
  final String image;

  ImageDTO(this.id, this.image);

  factory ImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDTOToJson(this);
}

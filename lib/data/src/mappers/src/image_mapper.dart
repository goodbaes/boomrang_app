import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/domain.dart';

class ImageMapper {
  ImageModel map(ImageDTO dto) => ImageModel(id: dto.id, url: dto.image);
}

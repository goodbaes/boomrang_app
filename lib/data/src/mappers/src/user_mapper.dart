import 'package:boomerang/domain/domain.dart';
import 'package:boomerang/utils/extensions/extensions.dart';
import 'package:boomerang/utils/formatters/formatters.dart';

import '../../../data.dart';

class UserMapper {
  final ImageMapper _imageMapper;

  UserMapper(this._imageMapper);

  BaseUserModel map(UserDTO dto) {
    if (!dto.name.isNullOrEmpty &&
        !dto.email.isNullOrEmpty &&
        !dto.birthdate.isNullOrEmpty &&
        dto.avatar != null) {
      return UserModel(
        id: dto.id,
        phone: dto.phone,
        name: dto.name!,
        email: dto.email!,
        avatar: _imageMapper.map(dto.avatar!),
        dateOfBirthdate: DateFormatter.parseYMD(dto.birthdate!),
      );
    } else {
      return UserModelNotEndRegForm(dto.id, dto.phone);
    }
  }

  UserModel mapForce(UserDTO dto) {
    return UserModel(
      id: dto.id,
      phone: dto.phone,
      name: dto.name!,
      email: dto.email!,
      avatar: _imageMapper.map(dto.avatar!),
      dateOfBirthdate: DateFormatter.parseYMD(dto.birthdate!),
    );
  }

  UserCompactModel mapUserCompact(UserCompactDTO dto) => UserCompactModel(
        id: dto.id,
        name: dto.name,
        avatar: ImageModel(id: '', url: ''),
      );
}

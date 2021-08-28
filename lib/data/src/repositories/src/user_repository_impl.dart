import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:boomerang/domain/domain.dart';
import 'package:boomerang/utils/constants.dart';

import '../../../data.dart';

class UserRepositoryImpl extends UserRepository {
  final UserApiClient _client;
  final UserMapper _userMapper;

  UserRepositoryImpl(
    this._client,
    this._userMapper,
  );

  final Rx<UserModel> _cacheUser = UserModel.empty().obs;

  @override
  Future<BaseUserModel> getUser() {
    return _client.getUser().then(_userMapper.map).then((value) {
      if (value is UserModel) {
        _cacheUser.value = value;
      }
      return value;
    });
  }

  @override
  Future<void> updateUser({
    required String id,
    required String phone,
    String? name,
    String? email,
    String? birthdate,
    String? avatar,
  }) {
    return _client
        .updateUser(
          id,
          UserUpdateDTO(
            phone: phone,
            name: name,
            email: email,
            birthdate: birthdate,
            avatar: avatar,
          ),
        )
        .then((value) => getUser());
  }

  @override
  Rx<UserModel> getCacheUserRx() => _cacheUser;
}

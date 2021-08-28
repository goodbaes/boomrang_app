import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:boomerang/utils/constants.dart';
import '../../../domain.dart';

abstract class UserRepository {
  Future<BaseUserModel> getUser();

  Future<void> updateUser({
    required String id,
    required String phone,
    String? name,
    String? email,
    String? birthdate,
    String? avatar,
  });

  Rx<UserModel> getCacheUserRx();
}

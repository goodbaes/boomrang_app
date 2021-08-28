import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class AuthRepository {
  String getToken();

  Rx<String> getTokenRx();

  void updateToken(String token);

  Future<void> sendCode(String phone);

  Future<String> login({
    required String phone,
    required String password,
  });

  void updateUserPhone(String phone);

  void updateUserPassword(String password);

  String getUserPhone();

  String getUserPassword();
}

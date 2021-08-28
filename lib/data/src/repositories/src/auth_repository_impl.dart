import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AppPreference _pref;
  final UserApiClient _client;

  AuthRepositoryImpl(
    this._pref,
    this._client,
  );

  @override
  String getToken() => _pref.token;

  @override
  Rx<String> getTokenRx() => _pref.tokenRx;

  @override
  Future<void> sendCode(String phone) => _client.sendCode(PhoneDTO(phone));

  @override
  Future<String> login({required String phone, required String password}) =>
      _client
          .login(LoginDTO(phone: phone, password: password))
          .then((v) => v.token);

  @override
  void updateToken(String token) => _pref.updateToken(token);

  @override
  String getUserPassword() => _pref.userPassword.val;

  @override
  String getUserPhone() => _pref.userPhone.val;

  @override
  void updateUserPassword(String password) => _pref.userPassword.val = password;

  @override
  void updateUserPhone(String phone) => _pref.userPhone.val = phone;
}

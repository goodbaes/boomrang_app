import 'package:dio/dio.dart';
import 'package:boomerang/data/data.dart';

const _tokenPrefix = 'JWT';

class AuthInterceptor extends InterceptorsWrapper {
  final AppPreference _pref;
  final Dio _dio;

  AuthInterceptor(this._pref, this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers.containsKey(HeadersKey.authorization)) {
      options.headers[HeadersKey.authorization] = _getToken();
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final requestOptions = err.requestOptions;
    if (statusCode != 401) {
      super.onError(err, handler);
    } else {
      _refreshToken(requestOptions, handler);
    }
  }

  String _getToken() => '$_tokenPrefix ${_pref.token}';

  void _refreshToken(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    _dio.interceptors..requestLock.lock()..responseLock.lock();
    final refreshDio = DioClient.client;
    final newToken = await UserApiClient(refreshDio)
        .refreshToken(
          TokenDTO(_pref.token),
          options: Options(headers: {HeadersKey.authorization: _getToken()}),
        )
        .then((value) => value.token)
        .catchError((e) {
      handler.reject(e);
      return '';
    }).whenComplete(
      () => _dio.interceptors..requestLock.unlock()..responseLock.unlock(),
    );
    _pref.updateToken(newToken);
    if (newToken.isNotEmpty) {
      requestOptions.headers[HeadersKey.authorization] =
          '$_tokenPrefix $newToken';
      refreshDio
          .fetch(requestOptions)
          .then(handler.resolve)
          .catchError((e) => handler.reject(e));
    }
  }
}

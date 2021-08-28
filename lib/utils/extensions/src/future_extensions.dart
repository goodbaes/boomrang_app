import 'package:dio/dio.dart';
import 'package:boomerang/domain/domain.dart';

extension CustomError<T> on Future<T> {
  Future<T> catchServerError(
    Function(ServerError) onServerError, {
    Function? onAnyError,
  }) {
    return catchError((e) {
      if (e is DioError) {
        try {
          return onServerError.call(ServerError.fromJson(e.response?.data));
        } catch (error) {
          return onAnyError?.call(error);
        }
      } else {
        return onAnyError?.call(e);
      }
    });
  }
}

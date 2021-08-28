import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;

const _prodBaseUrl = 'https://api-dev-privet-love.apptimizm.pro/api/v1';
const _devBaseUrl = 'https://api-dev-privet-love.apptimizm.pro/api/v1';

class DioClient {
  DioClient._();

  static Dio get client => Dio(
        BaseOptions(
          baseUrl: kReleaseMode ? _prodBaseUrl : _devBaseUrl,
        ),
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FilesApiClient implements FilesApiClient {
  _FilesApiClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ImageDTO> uploadImage(image, {receiveProgress, sendProgress}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageDTO>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': ''},
                extra: _extra)
            .compose(_dio.options, '/image/',
                queryParameters: queryParameters,
                data: _data,
                onSendProgress: sendProgress,
                onReceiveProgress: receiveProgress)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageDTO.fromJson(_result.data!);
    return value;
  }

  RequestOptions newRequestOptions(Options? options) {
    if (options is RequestOptions) {
      return options as RequestOptions;
    }
    if (options == null) {
      return RequestOptions(path: '');
    }
    return RequestOptions(
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      extra: options.extra,
      headers: options.headers,
      responseType: options.responseType,
      contentType: options.contentType.toString(),
      validateStatus: options.validateStatus,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirects,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
      path: '',
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

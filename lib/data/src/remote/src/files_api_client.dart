import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:boomerang/data/data.dart';

part 'files_api_client.g.dart';

@RestApi()
abstract class FilesApiClient {
  factory FilesApiClient(Dio dio) = _FilesApiClient;

  @POST('/image/')
  @Headers(HeadersKey.authorizationHeaderMap)
  Future<ImageDTO> uploadImage(
    @Part() File image, {
    @ReceiveProgress() ProgressCallback? receiveProgress,
    @SendProgress() ProgressCallback? sendProgress,
  });
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:boomerang/data/data.dart';
import 'package:boomerang/domain/domain.dart';

class FileRepositoryImpl extends FileRepository {
  final FilesApiClient _client;

  FileRepositoryImpl(this._client);

  @override
  Future<ImageModel> uploadImage(
    File file, {
    ProgressCallback? receiveProgress,
    ProgressCallback? sendProgress,
  }) =>
      _client
          .uploadImage(
            file,
            receiveProgress: receiveProgress,
            sendProgress: sendProgress,
          )
          .then((v) => ImageModel(id: v.id, url: v.image));
}

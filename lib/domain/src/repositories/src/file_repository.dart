import 'dart:io';

import 'package:dio/dio.dart';
import 'package:boomerang/domain/domain.dart';

abstract class FileRepository {
  Future<ImageModel> uploadImage(
    File file, {
    ProgressCallback? receiveProgress,
    ProgressCallback? sendProgress,
  });
}

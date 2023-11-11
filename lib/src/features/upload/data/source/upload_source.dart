import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_routes.dart';

abstract class IUploadSource {
  Future<void> uploadImage(File file);

  Future<void> uploadPDF(File file);
}

@LazySingleton(as: IUploadSource)
class UploadSourceImpl implements IUploadSource {
  UploadSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> uploadImage(File file) async {
    final bytes = await file.readAsBytes();
    final base64 = base64Encode(bytes);
    var data = FormData.fromMap({
      'photo': base64,
    });

    await _dio.request(
      'https://salarynow.in/testapi/imageapi.php',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
  }

  @override
  Future<void> uploadPDF(File file) async {
    final fileName = file.path.split('/').last;
    final multipartFile =
        await MultipartFile.fromFile(file.path, filename: fileName);
    final data = FormData.fromMap({
      'files': [multipartFile],
    });

    await _dio.request(
      APIRoutes.uploadPDF,
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
  }
}

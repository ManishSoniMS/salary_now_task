import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salary_now_task/src/core/base/type_defs.dart';
import 'package:salary_now_task/src/core/error/map_exception_to_failure.dart';
import 'package:salary_now_task/src/features/upload/data/source/upload_source.dart';
import 'package:salary_now_task/src/features/upload/domain/repository/upload_repository.dart';

@LazySingleton(as: UploadRepository)
class UploadRepositoryImpl implements UploadRepository {
  UploadRepositoryImpl(this._source) ;

  final IUploadSource _source;

  @override
  FailureOr<void> uploadImage(File file) async {
    try {
      final result = await _source.uploadImage(file);
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  FailureOr<void> uploadPDF(File file) async {
    try {
      final result = await _source.uploadPDF(file);
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}

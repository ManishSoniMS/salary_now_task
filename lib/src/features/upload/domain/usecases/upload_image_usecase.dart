import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/base/type_defs.dart';
import '../../../../core/base/usecase.dart';
import '../repository/upload_repository.dart';

@lazySingleton
class UploadImageUsecase extends IUseCase<void, File> {
  const UploadImageUsecase({
    required UploadRepository repository,
  }) : _repository = repository;

  final UploadRepository _repository;

  @override
  FailureOr<void> call(File param) async {
    return await _repository.uploadImage(param);
  }
}

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:salary_now_task/src/features/upload/domain/usecases/upload_image_usecase.dart';
import 'package:salary_now_task/src/features/upload/domain/usecases/upload_pdf_usecase.dart';

import '../../../../../core/constants/enum.dart';
import '../../../../../core/error/failure.dart';

part 'upload_state.dart';

part 'upload_cubit.freezed.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this._uploadImage, this._uploadPDF)
      : super(const UploadState.initial());
  final UploadImageUsecase _uploadImage;
  final UploadPDFUsecase _uploadPDF;

  Future<void> uploadImage(File file) async {
    emit(const _Uploading(UploadType.image));
    final result = await _uploadImage.call(file);

    result.fold(
      (l) => emit(_Failure(UploadType.image, l)),
      (r) => emit(const _Uploaded(UploadType.image)),
    );
  }

  Future<void> uploadPDF(File file) async {
    emit(const _Uploading(UploadType.pdf));
    final result = await _uploadPDF.call(file);

    result.fold(
      (l) => emit(_Failure(UploadType.pdf, l)),
      (r) => emit(const _Uploaded(UploadType.pdf)),
    );
  }
}

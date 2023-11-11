part of 'upload_cubit.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.initial() = _Initial;

  const factory UploadState.uploading(
    UploadType type,
  ) = _Uploading;

  const factory UploadState.uploaded(
    UploadType type,
  ) = _Uploaded;

  const factory UploadState.failure(
    UploadType type,
    Failure failure,
  ) = _Failure;
}

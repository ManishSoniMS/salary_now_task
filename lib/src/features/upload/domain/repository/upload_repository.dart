import 'dart:io';

import '../../../../core/base/type_defs.dart';

abstract class UploadRepository {
  FailureOr<void> uploadImage(File file);

  FailureOr<void> uploadPDF(File file);
}
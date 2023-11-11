import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enum.dart';
import '../bloc/upload/upload_cubit.dart';

showUploadingDialogBox(BuildContext context, UploadType type) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        final text = type == UploadType.image
            ? "Your Selfie is being upload..."
            : "Uploading PDF...";

        return SimpleDialog(
          alignment: Alignment.center,
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox.square(
              dimension: 20.0,
            ),
            BlocListener<UploadCubit, UploadState>(
              listener: (context, state) {
                state.whenOrNull(
                  uploaded: (type) => Navigator.pop(context),
                  failure: (type, failure) => Navigator.pop(context),
                );
              },
              child: Center(
                child: Text(text),
              ),
            ),
          ],
        );
      });
}

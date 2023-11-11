import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enum.dart';
import '../bloc/upload/upload_cubit.dart';
import '../widgets/show_uploading_dialog_box.dart';
import 'camera_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<File?> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'PDF'],
    );

    if (result != null) {
      return File(result.files.single.path!);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('SalaryNow Task'),
      ),
      body: BlocListener<UploadCubit, UploadState>(
        listener: (context, state) {
          state.whenOrNull(
            uploading: (type) {
              showUploadingDialogBox(context, type);
            },
            uploaded: (type) {
              final msg =
                  "${type == UploadType.image ? "Selfie" : "PDF file"} is uploaded!";
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));
            },
            failure: (type, failure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(failure.message)));
            },
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  final cameras = await availableCameras();
                  final cameraDescription = cameras.last;
                  if (mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            TakePictureScreen(camera: cameraDescription),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.camera),
                label: const Text("Take a Selfie"),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final file = await uploadFile();
                  if (file != null && mounted) {
                    context.read<UploadCubit>().uploadPDF(file);
                  }
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text("Upload A PDF"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

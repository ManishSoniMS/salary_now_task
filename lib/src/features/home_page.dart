import 'package:flutter/material.dart';
import 'package:salary_now_task/src/features/upload/presentation/pages/home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UploadPage(),
              ),
            );
          },
          child: const Text("Navigate to Upload Page"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'src/core/app/app.dart';
import 'src/core/app/injection/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const MyApp());
}

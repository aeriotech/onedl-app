import 'package:flutter/material.dart';
import 'package:fundl_app/config/config.service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigService.init();

  runApp(const App());
}

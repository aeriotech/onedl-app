import 'package:flutter/material.dart';

import 'auth/screens/login.screen.dart';
import 'common/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      home: LoginScreen(),
      theme: AppTheme.getDefault(),
    );
  }
}

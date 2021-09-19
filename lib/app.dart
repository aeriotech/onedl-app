import 'package:flutter/material.dart';
import 'package:fundl_app/auth/screens/forgot_password.screen.dart';
import 'package:fundl_app/auth/screens/register.screen.dart';

import 'auth/screens/login.screen.dart';
import 'common/theme.dart';
import 'home/screens/home.screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.getDefault(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}

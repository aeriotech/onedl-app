import 'package:flutter/material.dart';
import 'package:fundl_app/auth/screens/email_confirmation.screen.dart';
import 'package:fundl_app/auth/screens/forgot_password.screen.dart';
import 'package:fundl_app/auth/screens/register.screen.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:fundl_app/home/screens/main.screen.dart';
import 'package:fundl_app/profile/screens/profile.screen.dart';

import 'auth/screens/loading.screen.dart';
import 'auth/screens/login.screen.dart';
import 'common/theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.routeName,
      theme: AppTheme.getDefault(),
      routes: {
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        EmailConfirmation.routeName: (context) => const EmailConfirmation(),
        ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        CouponScreen.routeName: (context) => const CouponScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundl_app/auth/screens/age_confirmation.screen.dart';
import 'package:fundl_app/auth/screens/email_confirmation.screen.dart';
import 'package:fundl_app/auth/screens/forgot_password.screen.dart';
import 'package:fundl_app/auth/screens/register.screen.dart';
import 'package:fundl_app/coupon/screens/coupon.screen.dart';
import 'package:fundl_app/daily/screens/wheel.screen.dart';
import 'package:fundl_app/home/screens/main.screen.dart';

import 'auth/screens/loading.screen.dart';
import 'auth/screens/login.screen.dart';
import 'common/theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      initialRoute: LoadingScreen.routeName,
      theme: AppTheme.getDefault(),
      routes: {
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        EmailConfirmationScreen.routeName: (context) => const EmailConfirmationScreen(),
        AgeConfirmationScreen.routeName: (context) => AgeConfirmationScreen(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        DiscountScreen.routeName: (context) => const DiscountScreen(),
        WheelDailyScreen.routeName: (context) => const WheelDailyScreen(),
      },
    );
  }
}

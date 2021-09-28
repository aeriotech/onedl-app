import 'package:flutter/material.dart';
import 'package:fundl_app/auth/services/login.service.dart';
import 'package:fundl_app/home/screens/main.screen.dart';

import 'login.screen.dart';

class LoadingScreen extends StatelessWidget {
  static const routeName = '/loading';

  const LoadingScreen({Key? key}) : super(key: key);

  void _checkAuthentication(BuildContext context) async {
    if (!await LoginService.isLoggedIn()) {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      LoginService.loadToken();
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAuthentication(context);

    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fundl_app/auth/widgets/login_form.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

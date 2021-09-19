import 'package:flutter/material.dart';
import 'package:fundl_app/auth/widgets/register_form.widget.dart';

import 'login.screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleRedirectSignIn() {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              Row(
                children: const [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const RegisterForm(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: _handleRedirectSignIn,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

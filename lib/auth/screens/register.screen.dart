import 'package:flutter/material.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/conflict.exception.dart';
import 'package:fundl_app/auth/models/register.dto.dart';
import 'package:fundl_app/auth/screens/email_confirmation.screen.dart';
import 'package:fundl_app/auth/services/register.service.dart';
import 'package:fundl_app/auth/widgets/register_form.widget.dart';

import 'login.screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleRegister(RegisterDto registerDto) async {
      try {
        await RegisterService.register(registerDto);
        Navigator.of(context).pushReplacementNamed(EmailConfirmationScreen.routeName);
      } on BadRequestException {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter all fields'),
          ),
        );
      } on ConflictException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    }

    void _handleRedirectSignIn() {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
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
              RegisterForm(
                onRegister: _handleRegister,
              ),
              const SizedBox(height: 20.0),
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
                      'Sign In',
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

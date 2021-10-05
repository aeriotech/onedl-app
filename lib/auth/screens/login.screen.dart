import 'package:flutter/material.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/forbidden.exception.dart';
import 'package:fundl_app/api/exceptions/unauthorized.exception.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/auth/screens/age_confirmation.screen.dart';
import 'package:fundl_app/auth/screens/forgot_password.screen.dart';
import 'package:fundl_app/auth/screens/loading.screen.dart';
import 'package:fundl_app/auth/screens/register.screen.dart';
import 'package:fundl_app/auth/services/login.service.dart';
import 'package:fundl_app/auth/widgets/login_form.widget.dart';
import 'package:fundl_app/common/assets.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showErrorSnackbar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            heightFactor: 1,
            child: Text(message),
          ),
        ),
      );
    }

    void _handleLogin(LoginDto loginDto) async {
      try {
        await LoginService.login(loginDto);
        final user = await User.me();
        if (!user.ageConfirmed) {
          await Navigator.of(context).pushNamed(AgeConfirmationScreen.routeName);
        }
        Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
      } on BadRequestException {
        _showErrorSnackbar('Please enter your username and password');
      } on UnauthorizedException {
        _showErrorSnackbar('Wrong username or password');
      } on ForbiddenException {
        _showErrorSnackbar('You didn\'t confirm your email');
      }
    }

    void _handleForgotPassword() {
      Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
    }

    void _handleRedirectSignUp() {
      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(flex: 2),
              Image.asset(AppAssets.logo),
              const Spacer(flex: 1),
              Row(
                children: const [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              LoginForm(
                onLogin: _handleLogin,
                onForgotPassword: _handleForgotPassword,
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: _handleRedirectSignUp,
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

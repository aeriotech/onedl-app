import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/auth/screens/forgot_password.screen.dart';
import 'package:fundl_app/auth/screens/register.screen.dart';
import 'package:fundl_app/auth/widgets/login_form.widget.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/home/screens/main.screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleLogin(String username, String password) {
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    }

    void _handleForgotPassword() {
      Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
    }

    void _handleRedirectSignUp() {
      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              SvgPicture.asset(AppAssets.textLogo),
              const SizedBox(height: 70.0),
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
              const Spacer(),
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

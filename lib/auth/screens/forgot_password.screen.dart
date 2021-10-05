import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/auth/models/forgot_password.dto.dart';
import 'package:fundl_app/common/widgets/back_button.widget.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/forgot-password';

  ForgotPasswordScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();

  void _handleResetPassword(BuildContext context) async {
    await User.forgotPassword(
      ForgotPasswordDto(
        email: _emailController.text,
      ),
    );
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Email sent'),
        content: Text('The reset password link has been sent to ${_emailController.text}'),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: Navigator.of(context).pop,
          ),
        ],
      ),
    );
    Navigator.of(context).pop();
  }

  void _handleBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100.0),
                  const Text(
                    'Reset password',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Please enter your email address to request a password reset',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  FundlTextField(
                    decoration: const InputDecoration(
                      hintText: 'Your Email',
                      prefixIcon: Icon(IconlyLight.message),
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextIconButton(
                      text: 'RESET PASSWORD',
                      icon: IconlyLight.arrowRight,
                      onClick: () => _handleResetPassword(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ScreenBackButton(
            color: Colors.black,
            onClick: () => _handleBack(context),
          ),
        ],
      ),
    );
  }
}

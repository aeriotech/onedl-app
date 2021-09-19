import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    this.onLogin,
    this.onForgotPassword,
  }) : super(key: key);

  final Function(String, String)? onLogin;
  final VoidCallback? onForgotPassword;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailController, _passwordController;

  bool _showPassword = false;
  void _toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  Widget get _buildShowPasswordButton => IconButton(
        splashRadius: 16.0,
        icon: Icon(_showPassword ? IconlyLight.show : IconlyLight.hide),
        onPressed: _toggleShowPassword,
      );

  void _handleLogin() {
    if (widget.onLogin == null) return;
    widget.onLogin!(
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FundlTextField(
          controller: _emailController,
          decoration: const InputDecoration(
            hintText: 'abc@email.com',
            prefixIcon: Icon(IconlyLight.message),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.continueAction,
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: 'Your password',
            prefixIcon: const Icon(IconlyLight.lock),
            suffixIcon: _buildShowPasswordButton,
          ),
          keyboardType: TextInputType.text,
          obscureText: !_showPassword,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 20.0),
        GestureDetector(
          onTap: widget.onForgotPassword,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: TextIconButton(
            text: 'LOG IN',
            icon: IconlyLight.arrowRight,
            onClick: _handleLogin,
          ),
        ),
      ],
    );
  }
}

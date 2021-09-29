import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/auth/models/login.dto.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    this.onLogin,
    this.onForgotPassword,
  }) : super(key: key);

  final Function(LoginDto)? onLogin;
  final VoidCallback? onForgotPassword;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _usernameController, _passwordController;

  bool _showPassword = false;
  void _toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  Widget get _buildShowPasswordButton => IconButton(
        splashRadius: 16.0,
        icon: Icon(_showPassword ? IconlyLight.show : IconlyLight.hide),
        onPressed: _toggleShowPassword,
      );

  InputDecoration get _usernameInputDecoration => const InputDecoration(
        hintText: 'Username',
        prefixIcon: Icon(IconlyLight.profile),
      );

  InputDecoration get _passwordInputDecoration => InputDecoration(
        hintText: 'Password',
        prefixIcon: const Icon(IconlyLight.lock),
        suffixIcon: _buildShowPasswordButton,
      );

  TextStyle get _forgotPasswordStyle => const TextStyle(
        fontSize: 14.0,
      );

  void _handleLogin() {
    if (widget.onLogin == null) return;
    widget.onLogin!(LoginDto(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FundlTextField(
          controller: _usernameController,
          decoration: _usernameInputDecoration,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.continueAction,
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          controller: _passwordController,
          decoration: _passwordInputDecoration,
          keyboardType: TextInputType.text,
          obscureText: !_showPassword,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 20.0),
        GestureDetector(
          onTap: widget.onForgotPassword,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgor Password?',
                style: _forgotPasswordStyle,
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

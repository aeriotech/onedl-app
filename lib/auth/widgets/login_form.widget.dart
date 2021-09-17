import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPassword = false;
  void _toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  Widget get _buildShowPasswordButton => IconButton(
        splashRadius: 16.0,
        icon: Icon(_showPassword ? IconlyLight.show : IconlyLight.hide),
        onPressed: _toggleShowPassword,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FundlTextField(
          decoration: InputDecoration(
            hintText: 'abc@email.com',
            prefixIcon: Icon(IconlyLight.message),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          decoration: InputDecoration(
            hintText: 'Your password',
            prefixIcon: const Icon(IconlyLight.lock),
            suffixIcon: _buildShowPasswordButton,
          ),
          keyboardType: TextInputType.text,
          obscureText: !_showPassword,
        ),
        const SizedBox(height: 20.0),
        const TextIconButton(),
      ],
    );
  }
}

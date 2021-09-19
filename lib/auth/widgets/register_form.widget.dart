import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _firstNameController, _lastNameController, _emailController, _passwordController, _repeatPasswordController;

  bool _showPassword = false;
  void _toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  Widget get _buildShowPasswordButton => IconButton(
        splashRadius: 16.0,
        icon: Icon(_showPassword ? IconlyLight.show : IconlyLight.hide),
        onPressed: _toggleShowPassword,
      );

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FundlTextField(
          controller: _firstNameController,
          decoration: const InputDecoration(
            hintText: 'First name',
            prefixIcon: Icon(IconlyLight.profile),
          ),
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          controller: _lastNameController,
          decoration: const InputDecoration(
            hintText: 'Last name',
            prefixIcon: Icon(IconlyLight.profile),
          ),
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          controller: _emailController,
          decoration: const InputDecoration(
            hintText: 'abc@email.com',
            prefixIcon: Icon(IconlyLight.message),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          controller: _passwordController,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            hintText: 'Your password',
            prefixIcon: const Icon(IconlyLight.profile),
            suffixIcon: _buildShowPasswordButton,
          ),
        ),
        const SizedBox(height: 20.0),
        FundlTextField(
          controller: _repeatPasswordController,
          obscureText: !_showPassword,
          decoration: InputDecoration(
            hintText: 'Confirm password',
            prefixIcon: const Icon(IconlyLight.profile),
            suffixIcon: _buildShowPasswordButton,
          ),
        ),
        const SizedBox(height: 40.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: TextIconButton(
            text: 'SIGN UP',
            icon: IconlyLight.arrowRight,
          ),
        ),
      ],
    );
  }
}

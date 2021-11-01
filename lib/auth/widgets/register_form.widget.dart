import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/auth/models/register.dto.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

import 'checkbox_text.widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    this.onRegister,
  }) : super(key: key);

  final Function(RegisterDto)? onRegister;

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _usernameController, _firstNameController, _lastNameController, _emailController, _passwordController, _repeatPasswordController;

  bool ageConfirmed = false;

  void _handleRegister() {
    if (!ageConfirmed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check the box to continue'),
        ),
      );
      return;
    }
    final registerDto = RegisterDto(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (widget.onRegister != null) {
      widget.onRegister!(registerDto);
    }
  }

  bool _showPassword = false;
  void _toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  _setAgeConfirmed(bool? value) => setState(() => ageConfirmed = value ?? false);

  Widget get _buildShowPasswordButton => IconButton(
        splashRadius: 16.0,
        icon: Icon(_showPassword ? IconlyLight.show : IconlyLight.hide),
        onPressed: _toggleShowPassword,
      );

  InputDecoration get _firstNameInputDecoration => const InputDecoration(
        hintText: 'First name',
        prefixIcon: Icon(IconlyLight.profile),
      );

  InputDecoration get _lastNameInputDecoration => const InputDecoration(
        hintText: 'Last name',
        prefixIcon: Icon(IconlyLight.profile),
      );

  InputDecoration get _usernameInputDecoration => const InputDecoration(
        hintText: 'Username',
        prefixIcon: Icon(IconlyLight.profile),
      );

  InputDecoration get _emailInputDecoration => const InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(IconlyLight.message),
      );

  InputDecoration get _passwordInputDecoration => InputDecoration(
        hintText: 'Your password',
        prefixIcon: const Icon(IconlyLight.profile),
        suffixIcon: _buildShowPasswordButton,
      );

  InputDecoration get _confirmPasswordInputDecoration => InputDecoration(
        hintText: 'Confirm password',
        prefixIcon: const Icon(IconlyLight.profile),
        suffixIcon: _buildShowPasswordButton,
      );

  @override
  void initState() {
    _usernameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FundlTextField(
            controller: _firstNameController,
            decoration: _firstNameInputDecoration,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 20.0),
          FundlTextField(
            controller: _lastNameController,
            decoration: _lastNameInputDecoration,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 20.0),
          FundlTextField(
            controller: _usernameController,
            decoration: _usernameInputDecoration,
          ),
          const SizedBox(height: 20.0),
          FundlTextField(
            controller: _emailController,
            decoration: _emailInputDecoration,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20.0),
          FundlTextField(
            controller: _passwordController,
            obscureText: !_showPassword,
            decoration: _passwordInputDecoration,
          ),
          const SizedBox(height: 20.0),
          FundlTextField(
            controller: _repeatPasswordController,
            obscureText: !_showPassword,
            decoration: _confirmPasswordInputDecoration,
          ),
          const SizedBox(height: 20.0),
          CheckboxText(
            text: 'I am between 15 and 25 years old',
            value: ageConfirmed,
            onChanged: _setAgeConfirmed,
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextIconButton(
              text: 'SIGN UP',
              icon: IconlyLight.arrowRight,
              onClick: _handleRegister,
            ),
          ),
        ],
      ),
    );
  }
}

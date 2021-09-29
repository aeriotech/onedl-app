import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/auth/screens/login.screen.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class EmailConfirmationScreen extends StatelessWidget {
  static const routeName = '/confirm';

  const EmailConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleOk() {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100.0),
              const Text(
                'Confirm email',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'To continue please click the link in the email we just sent you.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextIconButton(
                  text: 'OK',
                  icon: IconlyLight.arrowRight,
                  onClick: _handleOk,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

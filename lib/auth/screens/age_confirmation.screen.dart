import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/api/exceptions/bad_request.exception.dart';
import 'package:fundl_app/api/exceptions/conflict.exception.dart';
import 'package:fundl_app/api/exceptions/forbidden.exception.dart';
import 'package:fundl_app/api/exceptions/not_found.exception.dart';
import 'package:fundl_app/api/models/user.model.dart';
import 'package:fundl_app/common/widgets/text_field.widget.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class AgeConfirmationScreen extends StatelessWidget {
  static const routeName = '/age-confirmation';

  AgeConfirmationScreen({Key? key}) : super(key: key);

  final _ageController = TextEditingController();

  final _ageInputDecoration = const InputDecoration(
    hintText: '0101003500420',
    prefixIcon: Icon(IconlyLight.document),
  );

  void _handleConfirmAge(BuildContext context) async {
    try {
      await User.confirmAge(_ageController.text);
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    } on BadRequestException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid EMŠO'),
        ),
      );
    } on ConflictException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User with this EMŠO already exists'),
        ),
      );
    } on NotFoundException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter an EMŠO'),
        ),
      );
    }
  }

  void _handleSkip(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100.0),
              const Text(
                'Age confirmation',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Please enter your EMŠO to confirm your age',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(height: 20.0),
              FundlTextField(
                controller: _ageController,
                decoration: _ageInputDecoration,
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextIconButton(
                  text: 'SUBMIT',
                  icon: IconlyLight.arrowRight,
                  onClick: () => _handleConfirmAge(context),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: () => _handleSkip(context),
                  child: const Text('Skip'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

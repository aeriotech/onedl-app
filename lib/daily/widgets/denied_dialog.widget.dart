import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class DeniedDialog extends StatelessWidget {
  const DeniedDialog({Key? key}) : super(key: key);

  TextStyle get _titleStyle => const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      );

  TextStyle get _descriptionStyle => const TextStyle(
        fontSize: 16.0,
      );

  void _handleClose(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Porabil si dnevni vrtljaj.',
                    style: _titleStyle,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Pridi spet jutri in zavrti svojo srečo. SPIN AND WIN kolo sreče ti omogoča 1 vrtljaj na dan.',
                    style: _descriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextIconButton(
              text: 'V redu',
              icon: IconlyLight.arrowRight,
              onClick: () => _handleClose(context),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckboxText extends StatelessWidget {
  const CheckboxText({
    Key? key,
    required this.text,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final String text;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged!(!value),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            fillColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}

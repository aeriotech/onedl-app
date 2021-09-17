import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TextIconButton extends StatefulWidget {
  const TextIconButton({Key? key}) : super(key: key);

  @override
  State<TextIconButton> createState() => _TextIconButtonState();
}

class _TextIconButtonState extends State<TextIconButton> {
  bool _pressed = false, _triggered = false;

  void _setPressed(bool pressed) => setState(() => _pressed = pressed);
  void _setTriggered(bool triggered) => setState(() => _triggered = triggered);

  BoxShadow _buildShadow(ColorScheme colorScheme) => _pressed || _triggered
      ? BoxShadow(
          offset: const Offset(0, 10.0),
          blurRadius: 35.0,
          color: colorScheme.primary.withOpacity(0.3),
        )
      : BoxShadow(
          offset: const Offset(0, 10.0),
          blurRadius: 35.0,
          spreadRadius: -10.0,
          color: colorScheme.primary.withOpacity(1),
        );

  Widget _buildIcon(BuildContext context) => Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryVariant,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: const Icon(
          IconlyLight.arrowRight,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTapDown: (_) {
        _setPressed(true);
        _setTriggered(true);
      },
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedContainer(
        height: 58.0,
        duration: const Duration(milliseconds: 200),
        onEnd: () => _setTriggered(false),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            _buildShadow(colorScheme),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _buildIcon(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

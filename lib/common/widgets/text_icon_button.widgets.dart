import 'package:flutter/material.dart';

class TextIconButton extends StatefulWidget {
  const TextIconButton({
    Key? key,
    required this.text,
    this.icon,
    this.onClick,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final VoidCallback? onClick;

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
        child: Icon(
          widget.icon,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: widget.onClick,
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: widget.icon != null,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _buildIcon(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

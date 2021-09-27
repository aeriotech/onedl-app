import 'package:flutter/material.dart';

class SquareBackground extends StatelessWidget {
  const SquareBackground({Key? key}) : super(key: key);

  final size = 25.0;

  @override
  Widget build(BuildContext context) {
    Widget _square() => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(
              color: Colors.white,
              width: 0.5,
            ),
          ),
        );

    final _xCount = (MediaQuery.of(context).size.width / size).floor();
    final _yCount = (MediaQuery.of(context).size.height / size).floor();

    final row = List.filled(_xCount, _square());
    final items = List.filled(
      _yCount,
      Wrap(
        children: row,
      ),
    );

    return Center(
      child: Wrap(
        children: items,
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundl_app/coming_soon/coming_soon.model.dart';

class ComingSoonItem extends StatelessWidget {
  const ComingSoonItem(
    this.comingSoon, {
    Key? key,
  }) : super(key: key);

  final ComingSoon comingSoon;

  BoxDecoration get _imageDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      );

  TextStyle get _textStyle => const TextStyle(
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: _imageDecoration,
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: comingSoon.image.url,
                width: 80.0,
                height: 80.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              comingSoon.name,
              style: _textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

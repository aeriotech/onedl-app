import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/common/models/category.model.dart';

class Wheel extends StatelessWidget {
  const Wheel({
    Key? key,
    required this.categories,
    required this.spinController,
    this.onSpin,
    this.onEnd,
  }) : super(key: key);

  final List<Category> categories;
  final StreamController<int> spinController;
  final VoidCallback? onSpin, onEnd;

  final size = 350.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: SizedBox(
              height: size,
              child: Transform.rotate(
                angle: -pi,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FortuneWheel(
                    selected: spinController.stream,
                    onAnimationEnd: onEnd,
                    animateFirst: false,
                    onFling: onSpin,
                    indicators: const [],
                    items: categories
                        .map(
                          (e) => FortuneItem(
                            child: CachedNetworkImage(
                              imageUrl: e.background.url,
                            ),
                            style: const FortuneItemStyle(
                              color: Colors.grey,
                              borderColor: Colors.grey,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Image.asset(
              AppAssets.wheel,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}

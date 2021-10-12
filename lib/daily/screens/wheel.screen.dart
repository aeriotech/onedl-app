import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class WheelDailyScreen extends StatelessWidget {
  static const routeName = '/daily';

  WheelDailyScreen({Key? key}) : super(key: key);

  final _spinController = StreamController<int>();
  final _confettiController = ConfettiController();

  void _onSpin() {
    _spinController.add(0);
  }

  void _onEnd(BuildContext context) {
    _confettiController.play();
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48.0),
        child: Image.asset(AppAssets.placeholderMcFundl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  FortuneWheel(
                    selected: _spinController.stream,
                    onAnimationEnd: () => _onEnd(context),
                    animateFirst: false,
                    onFling: _onSpin,
                    items: [
                      FortuneItem(
                        child: Image.asset(
                          AppAssets.placeholderPhone,
                        ),
                        style: const FortuneItemStyle(
                          color: Colors.orange,
                          borderColor: Colors.orange,
                        ),
                      ),
                      const FortuneItem(child: Text('Field 2')),
                      const FortuneItem(child: Text('Field 3')),
                      const FortuneItem(child: Text('Field 4')),
                      const FortuneItem(child: Text('Field 5')),
                      const FortuneItem(child: Text('Field 6')),
                      const FortuneItem(child: Text('Field 7')),
                      const FortuneItem(child: Text('Field 8')),
                      const FortuneItem(child: Text('Field 9')),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirectionality: BlastDirectionality.explosive,
                      numberOfParticles: 50,
                      maxBlastForce: 50,
                    ),
                  ),
                ],
              ),
            ),
            TextIconButton(
              text: 'Spin',
              onClick: _onSpin,
            ),
          ],
        ),
      ),
    );
  }
}

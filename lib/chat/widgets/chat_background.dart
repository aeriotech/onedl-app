import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fundl_app/common/assets.dart';

class ChatBackground extends StatelessWidget {
  const ChatBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Image.asset(
        AppAssets.chatPreview,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}

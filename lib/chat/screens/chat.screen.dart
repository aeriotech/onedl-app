import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/common/assets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.textLogo,
          height: 30.0,
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Coming soon',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ],
    );
  }
}

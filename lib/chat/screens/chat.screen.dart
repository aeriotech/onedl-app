import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/chat/widgets/chat_background.dart';
import 'package:fundl_app/common/assets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        ChatBackground(),
        Center(
          child: Text(
            'Coming soon',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ],
    );
  }
}

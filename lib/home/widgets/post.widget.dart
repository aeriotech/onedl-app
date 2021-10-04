import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.imageUrl,
    required this.url,
  }) : super(key: key);

  final String imageUrl;
  final String? url;

  void _handleClick() async {
    if (url != null && await canLaunch(url!)) {
      launch(url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleClick,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
      ),
    );
  }
}

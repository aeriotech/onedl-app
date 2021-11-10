import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundl_app/utils/snackbar.utils.dart';
import 'package:fundl_app/utils/url.utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.imageUrl,
    required this.url,
  }) : super(key: key);

  final String imageUrl;
  final String? url;

  void _handleClick(BuildContext context) async {
    if (url == null) {
      return;
    }
    if (await canLaunch(url!)) {
      launch(url!);
    } else {
      final http = isHttp(url!);
      if (http) {
        showSnackBar(context, 'There was an error opening the website');
      } else {
        showSnackBar(context, 'Please install the app');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleClick(context),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const SizedBox(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        height: 400.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fundl_app/common/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

  void _openUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _openUrl('https://instagram.com/fundl.si'),
          child: Image.asset(
            AppAssets.instagramLogo,
            height: 30.0,
          ),
        ),
        const SizedBox(width: 15.0),
        GestureDetector(
          onTap: () => _openUrl('https://discord.gg/85Z7jt9Vn6'),
          child: SvgPicture.asset(
            AppAssets.discordLogo,
            height: 30.0,
          ),
        ),
        const SizedBox(width: 15.0),
        GestureDetector(
          onTap: () => _openUrl('https://www.tiktok.com/@fundl.si'),
          child: Image.asset(
            AppAssets.tiktokLogo,
            height: 30.0,
          ),
        ),
      ],
    );
  }
}

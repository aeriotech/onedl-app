import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fundl_app/common/theme.dart';
import 'package:fundl_app/common/widgets/text_icon_button.widgets.dart';

class PrizeDialog extends StatelessWidget {
  const PrizeDialog({
    Key? key,
    required this.title,
    required this.description,
    this.imageUrl,
  }) : super(key: key);

  final String title, description;
  final String? imageUrl;

  BoxDecoration get _imageDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      );

  TextStyle get _titleTextStyle => const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      );

  TextStyle get _descriptionTextStyle => const TextStyle(
        fontSize: 18.0,
        color: AppTheme.darkGrey,
      );

  void _handleClose(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imageUrl != null)
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: _imageDecoration,
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  placeholder: (context, url) => const SizedBox(height: 200.0),
                ),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: _titleTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: _descriptionTextStyle,
                  ),
                  const SizedBox(height: 16),
                  TextIconButton(
                    text: 'Potrdi',
                    icon: IconlyLight.arrowRight,
                    onClick: () => _handleClose(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

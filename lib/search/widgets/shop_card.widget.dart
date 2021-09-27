import 'package:flutter/material.dart';
import 'package:fundl_app/common/assets.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(7.0, 1.0),
              blurRadius: 14.0,
              color: Color.fromRGBO(100, 100, 100, 0.30),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(AppAssets.placeholderLogo),
        ),
      ),
    );
  }
}

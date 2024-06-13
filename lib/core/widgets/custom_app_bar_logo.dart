import 'package:flutter/material.dart';
import 'package:ican_to/core/Utils/app_images.dart';

class CustomAppBarLogo extends StatelessWidget {
  const CustomAppBarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 80,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.appLogo3))),
    );
  }
}

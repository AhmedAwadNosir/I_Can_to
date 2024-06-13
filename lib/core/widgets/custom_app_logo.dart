import 'package:flutter/cupertino.dart';
import 'package:ican_to/core/Utils/app_images.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({
    super.key,
    this.appLogo,
  });
  final String? appLogo;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      appLogo ?? AppImages.appLogo,
      width: 81,
      height: 19,
    );
  }
}

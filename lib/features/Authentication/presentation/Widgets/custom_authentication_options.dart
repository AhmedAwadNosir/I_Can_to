import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';

import 'custom_authentication_option_styls.dart';

class CustomAuthinticationOptions extends StatelessWidget {
  const CustomAuthinticationOptions({
    super.key,
    required this.site1OnTap,
    required this.site2OnTap,
  });
  final void Function()? site1OnTap;
  final void Function()? site2OnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAuthenticationOptionStyle(
          siteIcon: AppImages.googleIcon,
          siteName: "google",
          onTap: site1OnTap,
        ),
        CustomAuthenticationOptionStyle(
          siteIcon: AppImages.facebookIcon,
          siteName: "Facebook",
          onTap: site2OnTap,
        ),
      ],
    );
  }
}

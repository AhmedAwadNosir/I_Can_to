import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/Utils/app_colors.dart';
import '../../../../Core/Utils/app_fonts_styles.dart';
import '../../../../Core/Utils/constans.dart';

class CustomAuthenticationOptionStyle extends StatelessWidget {
  const CustomAuthenticationOptionStyle({
    super.key,
    required this.siteIcon,
    required this.siteName,
    required this.onTap,
  });
  final String siteIcon;
  final String siteName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    siteIcon,
                  )),
              const SizedBox(
                width: 8,
              ),
              Text(
                siteName,
                style: AppFontsStyles.textstyle20.copyWith(
                    fontFamily: textFamilyMedium, color: Colors.white),
              )
            ],
          )),
    );
  }
}

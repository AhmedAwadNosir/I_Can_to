import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ican_to/core/utils/app_colors.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/features/Authentication/presentation/Widgets/page_initail_info.dart';

class CustomStatepage extends StatelessWidget {
  const CustomStatepage({
    super.key,
    required this.stateImage,
    required this.statetitle,
    required this.stateSubtitle,
    this.tilteStyle,
    this.subTitleStyle,
    this.spacebetweent,
    this.titleColor,
  });
  final String stateImage;
  final String statetitle;
  final String stateSubtitle;
  final TextStyle? tilteStyle;
  final TextStyle? subTitleStyle;
  final double? spacebetweent;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(stateImage),
        const SizedBox(
          height: 24,
        ),
        PageInitialinfo(
          pagegole: statetitle,
          pagegoledefination: stateSubtitle,
          textAlign: TextAlign.center,
          pagegoleStyle: AppFontsStyles.textstyle24.copyWith(
            fontFamily: textFamilyMedium,
            color: titleColor ?? AppColors.appNeutralColors900,
          ),
          sutptitleStyle: subTitleStyle,
          spacebetween: spacebetweent,
        )
      ],
    );
  }
}

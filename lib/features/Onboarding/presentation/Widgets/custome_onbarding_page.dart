import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';
import 'package:ican_to/features/Onboarding/data/models/onboarding_model.dart';
import '../../../../Core/Utils/app_colors.dart';
import '../../../../Core/Utils/constans.dart';

class CustomObardindPage extends StatelessWidget {
  const CustomObardindPage({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 375 / 341,
            child: Image.asset(
              onboardingModel.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 6, top: 24, bottom: 12),
            child: RichText(
              softWrap: true,
              text: TextSpan(
                text: onboardingModel.titlePart1,
                style: AppFontsStyles.textstyle32.copyWith(
                  fontFamily: textFamilyMedium,
                  color: AppColors.appNeutralColors900,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: onboardingModel.titlePart2,
                    style: AppFontsStyles.textstyle32.copyWith(
                      fontFamily: textFamilyMedium,
                      color: const Color(0xff3cc563),
                    ),
                  ),
                  TextSpan(
                    text: onboardingModel.titlePart3,
                    style: AppFontsStyles.textstyle32.copyWith(
                      fontFamily: textFamilyMedium,
                      color: AppColors.appNeutralColors900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 12, bottom: 36),
            child: Text(
              onboardingModel.subTitle,
              style: AppFontsStyles.textstyle16.copyWith(
                color: AppColors.appNeutralColors500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

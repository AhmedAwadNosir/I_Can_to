import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_colors.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/core/widgets/custom_app_barr.dart';
import 'package:ican_to/core/widgets/custom_app_logo.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Onboarding/functions/store_onboardin_info.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const id = "onboardingview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftPart: const CustomAppLogo(
          appLogo: AppImages.appLogo3,
        ),
        rightpart: GestureDetector(
          onTap: () async {
            await storeOnboardinInfo();
            Navigator.pushReplacementNamed(context, SignInView.id);
          },
          child: Text(
            "Skip",
            style: AppFontsStyles.textstyle16.copyWith(
              color: AppColors.appNeutralColors500,
            ),
          ),
        ),
      ),
      body: const OnboardingViewBody(),
    );
  }
}

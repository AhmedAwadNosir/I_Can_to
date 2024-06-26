import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_colors.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/core/widgets/custom_state_page.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/custom_button.dart';

class SuccessAccountIlsrationViewBody extends StatelessWidget {
  const SuccessAccountIlsrationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 97,
          ),
          CustomStatepage(
            stateImage: AppImages.successaccount,
            statetitle: "Your account has been set up!",
            stateSubtitle:
                "We have customized feeds according to your preferences",
            subTitleStyle: AppFontsStyles.textstyle14
                .copyWith(color: AppColors.appNeutralColors500),
          ),
          const Spacer(),
          CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignInView.id);
              },
              buttonName: "Get Started"),
          const SizedBox(
            height: 9,
          ),
        ],
      ),
    );
  }
}

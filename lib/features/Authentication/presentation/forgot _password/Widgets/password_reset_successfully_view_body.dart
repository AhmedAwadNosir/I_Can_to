import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/core/widgets/custom_state_page.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/custom_button.dart';

class PasswordResetSuccessfullyViewBody extends StatelessWidget {
  const PasswordResetSuccessfullyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 160,
          ),
          const CustomStatepage(
            stateImage: AppImages.passowrdresetsuccessfullly,
            statetitle: "Password changed    succesfully!",
            stateSubtitle:
                "Your password has been changed successfully, we will let you know if there are more problems with your account",
            spacebetweent: 12,
          ),
          const Spacer(),
          CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInView.id);
              },
              buttonName: "Go and Login!"),
          const SizedBox(
            height: 9,
          ),
        ],
      ),
    );
  }
}

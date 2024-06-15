import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/core/widgets/custom_state_page.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/functions/open_gmail_app.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/password_reset_successfully_view.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/reset_password_view.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/custom_button.dart';

class CheckEmialViewBody extends StatelessWidget {
  const CheckEmialViewBody({super.key});

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
            stateImage: AppImages.checkEmail,
            statetitle: "Check your Email",
            stateSubtitle:
                "We have sent a reset password to your email address",
            spacebetweent: 12,
          ),
          const Spacer(),
          CustomButton(
              onPressed: () async {
                // this function open email messages on your app
                await openGmail();
                Navigator.pushNamed(context, PasswordResetSuccessfullyView.id);
              },
              buttonName: "Open email app"),
          const SizedBox(
            height: 9,
          ),
        ],
      ),
    );
  }
}

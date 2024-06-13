import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/app_colors.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/core/utils/service_locator.dart';
import 'package:ican_to/core/widgets/custom_app_bar_logo.dart';
import 'package:ican_to/core/widgets/custom_app_barr.dart';
import 'package:ican_to/features/Authentication/data/Models/repos/auth_repo_impl.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Widgets/sign_in_view_body_block_consumer.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/SignIn/sign_in_cubit.dart';
import 'package:ican_to/features/Home/presentation/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const id = "signInView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftPart: Image.asset(AppImages.appLogo3),
        rightpart: GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString(loginSkiped, "true");
            Navigator.pushReplacementNamed(context, HomeView.id);
          },
          child: Text(
            "Skip",
            style: AppFontsStyles.textstyle16.copyWith(
              color: AppColors.appNeutralColors500,
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: const SignInViewBodyBlockConsumer(),
      ),
    );
  }
}

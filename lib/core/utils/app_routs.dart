import 'package:flutter/material.dart';
import 'package:ican_to/features/Authentication/presentation/Create_Account/Views/register_view.dart';
import 'package:ican_to/features/Authentication/presentation/Create_Account/Views/sucess_account_ilstration.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/check_emial_view.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/forgot_password_view.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/password_reset_successfully_view.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/reset_password_view.dart';

import 'package:ican_to/features/Home/views/from_sign_language_view.dart';
import 'package:ican_to/features/Home/views/home_view.dart';
import 'package:ican_to/features/Home/views/to_sign_language_view.dart';
import 'package:ican_to/features/Onboarding/presentation/Views/onboarding_view.dart';
import 'package:ican_to/features/Onboarding/presentation/Views/splash_view.dart';
import 'package:ican_to/features/aboutUs/views/about_developers_view.dart';
import 'package:ican_to/features/aboutUs/views/about_program_view.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashView.id: (context) => const SplashView(),
    OnboardingView.id: (context) => const OnboardingView(),
    SignInView.id: (context) => const SignInView(),
    RegisterView.id: (context) => const RegisterView(),
    SuccessAcountIlstrationView.id: (context) =>
        const SuccessAcountIlstrationView(),
    ForgotPasswordView.id: (context) => const ForgotPasswordView(),
    CheckEmialView.id: (context) => const CheckEmialView(),
    ResetPasswordView.id: (context) => const ResetPasswordView(),
    PasswordResetSuccessfullyView.id: (context) =>
        const PasswordResetSuccessfullyView(),
    HomeView.id: (context) => const HomeView(),
    ToSignLanguageView.id: (context) => const ToSignLanguageView(),
    FromSignLanguage.id: (context) => const FromSignLanguage(),
    AboutProgramView.id: (context) => const AboutProgramView(),
    AboutDevelopersView.id: (context) => const AboutDevelopersView(),
  };
}

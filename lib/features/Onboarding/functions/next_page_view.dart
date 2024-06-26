import 'package:flutter/material.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Onboarding/functions/store_onboardin_info.dart';

import '../presentation/Widgets/onboarding_page_view_builder.dart';

void goToNextPage({required pageController, required context}) async {
  if (pageController.page! <
      OnbardingPageViewBuilder.onbardingPagesdata.length - 1) {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  } else if (pageController.page ==
      OnbardingPageViewBuilder.onbardingPagesdata.length - 1) {
    await storeOnboardinInfo();
    Navigator.pushReplacementNamed(context, SignInView.id);
  }
}

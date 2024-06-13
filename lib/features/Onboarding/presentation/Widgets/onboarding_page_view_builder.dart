import 'package:flutter/material.dart';
import 'package:ican_to/core/Utils/app_images.dart';
import 'package:ican_to/features/Onboarding/data/models/onboarding_model.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/custome_onbarding_page.dart';

class OnbardingPageViewBuilder extends StatelessWidget {
  const OnbardingPageViewBuilder({super.key, required this.pageController});
  final PageController pageController;
  static List<OnboardingModel> onbardingPagesdata = [
    OnboardingModel(
      image: AppImages.onboarding1,
      titlePart1: "Welcome to our Sign  ",
      titlePart2: "Language App! ",
      titlePart3: "Discover the power of expression",
      subTitle:
          "Learn to communicate effortlessly by translating natural language into sign language.",
    ),
    OnboardingModel(
      image: AppImages.onboarding2,
      titlePart1: "Expand your horizons!",
      titlePart2: "With our app ",
      titlePart3: "Open doors to inclusivity",
      subTitle:
          "Our app empowers you to bridge the gap between sign language and natural language.",
    ),
    OnboardingModel(
      image: AppImages.onboarding3,
      titlePart1: "Break barriers of  ",
      titlePart2: "communication! Enhance ",
      titlePart3: "understanding and communication",
      subTitle:
          "Learn sign language and effortlessly translate it into natural language with our user-friendly app.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onbardingPagesdata.length,
      itemBuilder: (context, index) {
        return CustomObardindPage(onboardingModel: onbardingPagesdata[index]);
      },
    );
  }
}

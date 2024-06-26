import 'package:flutter/material.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/onboarding_page_view_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../functions/next_page_view.dart';
import 'custom_button.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _pageController;
  int currentPage = 0;
  bool isLastPage = false;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    _pageController.addListener(_pagelistener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController.removeListener(_pagelistener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: OnbardingPageViewBuilder(
            pageController: _pageController,
          )),
          SmoothPageIndicator(
            controller: _pageController,
            count: OnbardingPageViewBuilder.onbardingPagesdata.length,
            effect: WormEffect(
              activeDotColor: const Color(0xff3cc563),
              dotColor: const Color(0xff3cc563).withOpacity(0.2),
              dotHeight: 6,
              dotWidth: 6,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 36, bottom: 25, left: 24, right: 24),
            child: CustomButton(
              onPressed: () {
                goToNextPage(context: context, pageController: _pageController);
              },
              buttonName: "Next",
              islastPage: isLastPage,
            ),
          )
        ],
      ),
    );
  }

  void _pagelistener() {
    setState(() {
      currentPage = _pageController.page!.round();
      isLastPage =
          currentPage == OnbardingPageViewBuilder.onbardingPagesdata.length - 1;
    });
  }
}

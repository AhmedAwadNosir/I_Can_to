import 'package:flutter/material.dart';
import 'package:ican_to/core/Utils/app_images.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Home/views/home_view.dart';
import 'package:ican_to/features/Onboarding/presentation/Views/onboarding_view.dart';
import 'package:ican_to/main.dart';
import '../../functions/splash_navigation_controler.dart';
import '../Widgets/circle_container.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const id = 'splashview';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    spalshNavigationControlar(
        context: context,
        destination: isViewed == null
            ? OnboardingView.id
            : ((isLoginIn == true || isLoginskiped == true)
                ? HomeView.id
                : SignInView.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(children: [
          CircleContainer(
              height: screenHeight * 0.8620,
              width: screenWidth * 1.87,
              color: 0XFFCCF9D9),
          CircleContainer(
              height: screenHeight * 0.657,
              width: screenWidth * 1.424,
              color: 0XFFb4e9c3),
          CircleContainer(
              height: screenHeight * 0.423,
              width: screenWidth * 0.917,
              color: 0XFFa4dfb5),
          CircleContainer(
            height: screenHeight * 0.233,
            width: screenWidth * 0.507,
            color: 0XFFE8F0FF,
            image: AppImages.appLogo,
          )
        ]),
      ),
    );
  }
}

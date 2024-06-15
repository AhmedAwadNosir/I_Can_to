import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Home/views/from_sign_language_view.dart';
import 'package:ican_to/features/Home/views/to_sign_language_view.dart';
import 'package:ican_to/features/Home/widgets/custom_choose_button.dart';
import 'package:ican_to/features/Home/widgets/intoductory_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const IntroductorySection(),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image(image: AssetImage(AppImages.homeAppLogo)),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        start: BorderSide(color: Color(0xff3CC563), width: 6))),
                child: const Text(
                  " Sign Language Translator",
                  style: TextStyle(
                      color: Color(0xff3CC563),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage(
                    AppImages.appimage1,
                  ),
                  fit: BoxFit.cover,
                )),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomChooseButton(
                    onPressed: () {
                      log("hi");
                      Navigator.pushNamed(context, ToSignLanguageView.id);
                    },
                    buttonLable: "  Translate To Sign Language   ",
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Image(image: AssetImage(AppImages.updown)),
                  ),
                  CustomChooseButton(
                    buttonLable: "Translate From Sign Language",
                    onPressed: () {
                      Navigator.pushNamed(context, FromSignLanguage.id);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        //
      ],
    );
  }
}

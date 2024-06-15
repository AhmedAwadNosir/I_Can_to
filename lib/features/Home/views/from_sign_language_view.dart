import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Home/widgets/from_sign_language_view_body.dart';

class FromSignLanguage extends StatelessWidget {
  const FromSignLanguage({super.key});
  static String id = "FromSignLanguage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Image(image: AssetImage(AppImages.logo2copy1)),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.appimage1),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: const FromSignLanguagebody()),
      ),
    );
  }
}

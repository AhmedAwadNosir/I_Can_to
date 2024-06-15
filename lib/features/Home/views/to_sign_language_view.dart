import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Home/widgets/to_sign_language_view_body.dart';

class ToSignLanguageView extends StatelessWidget {
  const ToSignLanguageView({super.key});

  static String id = "ToSignLanguageView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Image(image: AssetImage(AppImages.logo2copy1)),
        ),
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.appimage1),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: const ToSignLanguageViewBody()),
        ),
      ),
    );
  }
}

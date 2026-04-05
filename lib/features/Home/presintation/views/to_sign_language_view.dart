import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Home/presintation/widgets/to_sign_language_view_body.dart';

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
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.appimage1),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const ToSignLanguageViewBody(),
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "This Section will Be Add Soon !",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}

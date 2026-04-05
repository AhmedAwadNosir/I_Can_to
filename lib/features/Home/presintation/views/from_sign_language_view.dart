import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Home/manager/add_to_favorite/add_to_favorite_cubit.dart';
import 'package:ican_to/features/Home/manager/translate_from_sign_language/translate_from_sign_language_cubit.dart';
import 'package:ican_to/features/Home/presintation/widgets/from_sign_language_view_body_bloc_consumer.dart';

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
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => TranslateFromSignLanguageCubit(),
                ),
                BlocProvider(
                  create: (context) => AddToFavoriteCubit(),
                ),
              ],
              child: const FromSignLanguageViewBodyBlocConsumer(),
            )),
      ),
    );
  }
}

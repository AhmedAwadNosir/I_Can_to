import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Home/manager/add_to_favorite/add_to_favorite_cubit.dart';
import 'package:ican_to/features/Home/manager/translate_from_sign_language/translate_from_sign_language_cubit.dart';
import 'package:ican_to/features/Home/presintation/widgets/from_sign_language_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FromSignLanguageViewBodyBlocConsumer extends StatelessWidget {
  const FromSignLanguageViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslateFromSignLanguageCubit,
        TranslateFromSignLanguageState>(
      listener: (context, state) {
        if (state is TranslateFromSignLanguageFailure) {
          showSnackBar(state.errorMessage, context);
        }
      },
      builder: (context, stateTranslation) {
        return BlocConsumer<AddToFavoriteCubit, AddToFavoriteState>(
          listener: (context, state) {
            if (state is AddToFavoriteFailure) {
              showSnackBar(state.errorMessage, context);
            } else if (state is AddToFavoriteSuccess) {
              showSnackBar(
                  "Your translation sccesfully Added to favorit List", context);
            }
          },
          builder: (context, stateAddToFavorit) {
            return ModalProgressHUD(
                inAsyncCall:
                    (stateTranslation is TranslateFromSignLanguageLoading ||
                            stateAddToFavorit is AddToFavoriteLoading)
                        ? true
                        : false,
                child: FromSignLanguagebody(
                  answer: stateTranslation is TranslateFromSignLanguageSuccess
                      ? stateTranslation.result
                      : "",
                ));
          },
        );
      },
    );
  }
}

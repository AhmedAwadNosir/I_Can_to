part of 'translate_from_sign_language_cubit.dart';

@immutable
sealed class TranslateFromSignLanguageState {}

final class TranslateFromSignLanguageInitial
    extends TranslateFromSignLanguageState {}

final class TranslateFromSignLanguageLoading
    extends TranslateFromSignLanguageState {}

final class TranslateFromSignLanguageFailure
    extends TranslateFromSignLanguageState {
  final String errorMessage;

  TranslateFromSignLanguageFailure({required this.errorMessage});
}

final class TranslateFromSignLanguageSuccess
    extends TranslateFromSignLanguageState {
  final dynamic result;

  TranslateFromSignLanguageSuccess({required this.result});
}

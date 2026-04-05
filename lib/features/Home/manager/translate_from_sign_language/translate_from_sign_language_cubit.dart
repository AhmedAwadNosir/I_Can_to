import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'translate_from_sign_language_state.dart';

class TranslateFromSignLanguageCubit
    extends Cubit<TranslateFromSignLanguageState> {
  TranslateFromSignLanguageCubit() : super(TranslateFromSignLanguageInitial());

  Future<void> translateFromSignLanguage({required String imagePath}) async {
    emit(TranslateFromSignLanguageLoading());
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://exudative-auriform-alphonse.ngrok-free.dev/upload"));
      request.files.add(http.MultipartFile(
          'frame',
          File(imagePath).readAsBytes().asStream(),
          File(imagePath).lengthSync(),
          filename: imagePath.split("/").last));
      var res = await request.send();
      log(res.statusCode.toString());
      var responseData = await res.stream.transform(utf8.decoder).join();

      log(responseData);
      emit(TranslateFromSignLanguageSuccess(result: responseData));
    } catch (e) {
      emit(TranslateFromSignLanguageFailure(errorMessage: e.toString()));
    }
  }
}

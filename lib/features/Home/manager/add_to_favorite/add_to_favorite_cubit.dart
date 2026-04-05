import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/features/Home/data/models/translated_item_model.dart';
import 'package:meta/meta.dart';
part 'add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  AddToFavoriteCubit() : super(AddToFavoriteInitial());

  Future<void> AddToFavoritList(
      {required String transledImage,
      required String translationResult,
      required String translationType}) async {
    emit(AddToFavoriteLoading());
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final FirebaseAuth auth = FirebaseAuth.instance;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('d-M-yyyy').format(now);
      String formattedTime = DateFormat('H:mm').format(now);
      String dateTimeString = '$formattedDate  $formattedTime';
      log(dateTimeString);
      await firestore.collection("FavoritList").doc().set(TranslatedItemModel(
              translationImage: transledImage,
              translationText: translationResult,
              date: dateTimeString,
              translationType: translationType)
          .toJson());
      emit(AddToFavoriteSuccess());
    } catch (e) {
      emit(AddToFavoriteFailure(errorMessage: e.toString()));
    }
  }
}

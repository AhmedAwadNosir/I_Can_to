import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'delet_item_form_fav_list_state.dart';

class DeletItemFormFavListCubit extends Cubit<DeletItemFormFavListState> {
  DeletItemFormFavListCubit() : super(DeletItemFormFavListInitial());
  Future<void> deletItemFromList(final String deltedItem) async {
    emit(DeletItemFormFavListLoading());
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection("FavoritList")
          .where("translationImage", isEqualTo: deltedItem)
          .get();

      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
      emit(DeletItemFormFavListSuccess());
    } catch (e) {
      emit(DeletItemFormFavListFailure(errorMessage: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ican_to/features/Home/data/models/translated_item_model.dart';
import 'package:meta/meta.dart';

part 'fetch_favorit_list_state.dart';

class FetchFavoritListCubit extends Cubit<FetchFavoritListState> {
  FetchFavoritListCubit() : super(FetchFavoritListInitial());

  Future<void> fetchFavoritListData() async {
    List<TranslatedItemModel> favoritListData = [];
    emit(FetchFavoritListLoading());
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection("FavoritList").get();
      for (var snap in snapshot.docs) {
        favoritListData.add(TranslatedItemModel.fromJson(snap.data()));
      }
      emit(FetchFavoritListSuccess(favoritList: favoritListData));
    } catch (e) {
      emit(FetchFavoritListFailure(
          errorMessage:
              "something wrong has habend with message ${e.toString()}?check your internet conection and try agin later!"));
    }
  }
}

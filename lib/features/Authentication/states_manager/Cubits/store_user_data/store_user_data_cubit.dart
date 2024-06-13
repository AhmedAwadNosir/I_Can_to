import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/features/Authentication/functions/store_user_data.dart';
import 'package:meta/meta.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
part 'store_user_data_state.dart';

class StoreUserDataCubit extends Cubit<StoreUserDataState> {
  StoreUserDataCubit() : super(StoreUserDataInitial());
  Future storeUserDatac(
      {required UserCredential credential,
      required UserModel userModal}) async {
    emit(StoreUserDataLoading());
    try {
      final userData = credential.user;
      await storeUserData(credential, userModal);
      emit(StoreUserDataSuccess());
    } catch (e) {
      emit(StoreUserDataFialure(
          errorMessage:
              "opps an error has happend ${e.toString()} please cheak your internet Conection?"));
    }
  }
}

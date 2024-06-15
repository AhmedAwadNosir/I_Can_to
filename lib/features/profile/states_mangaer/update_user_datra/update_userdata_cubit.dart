import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/profile/functions/update_user_data.dart';
import 'package:meta/meta.dart';

part 'update_userdata_state.dart';

class UpdateUserdataCubit extends Cubit<UpdateUserdataState> {
  UpdateUserdataCubit() : super(UpdateUserdataInitial());

  Future<void> updateUserData(UserModel userData) async {
    emit(UpdateUserdataLoading());
    try {
      await updateUserProfileData(UserModel(
        userName: userData.userName,
        userPhoto: userData.userPhoto,
        birthdate: userData.birthdate,
        country: userData.country,
        bio: userData.bio,
      ).tojson());
      emit(UpdateUserdataSuccess());
    } on FirebaseException catch (e) {
      emit(UpdateUserdataFailure(errorMessage: e.message.toString()));
    } catch (e) {
      emit(UpdateUserdataFailure(errorMessage: e.toString()));
    }
  }
}

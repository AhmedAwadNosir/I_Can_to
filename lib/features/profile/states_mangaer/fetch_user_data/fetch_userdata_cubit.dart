import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:meta/meta.dart';

part 'fetch_userdata_state.dart';

class FetchUserdataCubit extends Cubit<FetchUserdataState> {
  FetchUserdataCubit() : super(FetchUserdataInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future fetchUserData() async {
    final UserModel userData;
    emit(FetchUserdataLoading());
    try {
      final snapshot = await _firestore
          .collection(colectionUsers)
          .doc(_auth.currentUser!.uid)
          .get();
      userData = UserModel.fromjson(snapshot.data() as Map<String, dynamic>);
      log(userData.userPhoto.toString());
      log(userData.userName.toString());
      log(userData.gender.toString());
      log(userData.country.toString());
      log(userData.birthdate.toString());
      emit(FetchUserdataSuccess(userData: userData));
    } on FirebaseException catch (e) {
      emit(FetchUserdataFailure(errorMessage: e.message.toString()));
    } catch (e) {
      emit(FetchUserdataFailure(errorMessage: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/Authentication/functions/sign_in_with_facebook.dart';
import 'package:ican_to/features/Authentication/functions/sign_in_with_google.dart';
import 'package:ican_to/features/Authentication/functions/store_user_data.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  void registerWithEmailAndPassword(
      {required UserModel userModel, required String password}) async {
    emit(RegisterLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email!.trim(),
        password: password.trim(),
      );
      await storeUserData(credential, userModel);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  void signUpWithGoogle({required UserModel userModel}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await signInWithGoogle();
      userModel.userCredential = userCredential;
      await storeUserData(userCredential, userModel);

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure("Error happend with googl sign in try Again Later"));
    }
    return null;
  }

  // void signUpWithFacebook({required UserModel userModel}) async {
  //   emit(RegisterLoading());
  //   try {
  //     UserCredential userCredential = await signInWithFacebook();
  //     userModel.userCredential = userCredential;
  //     await storeUserData(userCredential, userModel);
  //     emit(RegisterSuccess());
  //   } catch (e) {
  //     emit(RegisterFailure("'ERROR_FACEBOOK_LOGIN_FAILED try Agian later'"));
  //   }
  //   return null;
  // }
}

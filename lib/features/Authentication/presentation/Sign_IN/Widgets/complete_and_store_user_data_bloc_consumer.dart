import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Widgets/complete_and_sotore_user_data_view_body.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/store_user_data/store_user_data_cubit.dart';
import 'package:ican_to/features/Home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CompleteAndStoreUserDataBlocConsumer extends StatelessWidget {
  const CompleteAndStoreUserDataBlocConsumer({
    super.key,
    required this.userId,
    required this.credential,
  });

  final String userId;
  final UserCredential credential;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreUserDataCubit, StoreUserDataState>(
      listener: (context, state) {
        if (state is StoreUserDataFialure) {
          showSnackBar(state.errorMessage, context);
        }
        if (state is StoreUserDataSuccess) {
          showSnackBar("your data sotred successfully ! ", context);
          Navigator.pushReplacementNamed(context, HomeView.id);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is StoreUserDataLoading ? true : false,
          child: CompleteAndStorUserDataViewBody(
            userId: userId,
            credential: credential,
          ),
        );
      },
    );
  }
}

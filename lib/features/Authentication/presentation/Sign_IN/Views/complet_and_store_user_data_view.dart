import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Widgets/complete_and_store_user_data_bloc_consumer.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/store_user_data/store_user_data_cubit.dart';

class CompletAndStoreUserDataView extends StatelessWidget {
  const CompletAndStoreUserDataView(
      {super.key, required this.credential, required this.userId});
  final UserCredential credential;
  final String userId;
  static const id = "CompletAndStoreUserData";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreUserDataCubit(),
      child: CompleteAndStoreUserDataBlocConsumer(
          userId: userId, credential: credential),
    );
  }
}

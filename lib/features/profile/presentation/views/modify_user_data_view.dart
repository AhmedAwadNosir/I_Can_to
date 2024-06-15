import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/profile/presentation/widgets/modify_user_data_bloc_consumer.dart';
import 'package:ican_to/features/profile/states_mangaer/update_user_datra/update_userdata_cubit.dart';

class ModifyUserDataView extends StatelessWidget {
  const ModifyUserDataView({super.key, required this.userData});
  final UserModel userData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserdataCubit(),
      child: ModifyUserDataBlockConsumer(userData: userData),
    );
  }
}

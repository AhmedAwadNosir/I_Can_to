import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/profile/presentation/widgets/modefiy_user_data_view_body.dart';
import 'package:ican_to/features/profile/states_mangaer/fetch_user_data/fetch_userdata_cubit.dart';
import 'package:ican_to/features/profile/states_mangaer/update_user_datra/update_userdata_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ModifyUserDataBlockConsumer extends StatelessWidget {
  const ModifyUserDataBlockConsumer({
    super.key,
    required this.userData,
  });

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserdataCubit, UpdateUserdataState>(
      listener: (context, state) {
        if (state is UpdateUserdataFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errorMessage),
              );
            },
          );
        } else if (state is UpdateUserdataSuccess) {
          BlocProvider.of<FetchUserdataCubit>(context).fetchUserData();
          Navigator.pop(context);
          showSnackBar("Your Data Has been Updated Successfully", context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is UpdateUserdataLoading ? true : false,
            child: ModefiyUserDataViewBody(userData: userData));
      },
    );
  }
}

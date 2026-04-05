import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:ican_to/features/profile/states_mangaer/fetch_user_data/fetch_userdata_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileViewBodyBlocConsumer extends StatefulWidget {
  ProfileViewBodyBlocConsumer({
    super.key,
  });
  @override
  State<ProfileViewBodyBlocConsumer> createState() =>
      _ProfileViewBodyBlocConsumerState();
}

class _ProfileViewBodyBlocConsumerState
    extends State<ProfileViewBodyBlocConsumer> {
  @override
  void initState() {
    BlocProvider.of<FetchUserdataCubit>(context).fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchUserdataCubit, FetchUserdataState>(
      listener: (context, state) {
        if (state is FetchUserdataFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errorMessage),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is FetchUserdataLoading ? true : false,
            child: ProfileViewBody(
              userData:
                  state is FetchUserdataSuccess ? state.userData : UserModel(),
            ));
      },
    );
  }
}

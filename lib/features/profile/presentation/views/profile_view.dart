import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/profile/presentation/widgets/profile_view_body_bloc_consumer.dart';
import 'package:ican_to/features/profile/states_mangaer/fetch_user_data/fetch_userdata_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/profile_view_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const id = 'ProfileEditView';
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ProfileViewBodyBlocConsumer();
  }
}

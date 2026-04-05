import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ican_to/features/profile/presentation/widgets/no_user_profile_view.dart';
import 'package:ican_to/features/profile/presentation/widgets/profile_view_body_bloc_consumer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const id = 'ProfileEditView';
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return auth.currentUser != null
        ? ProfileViewBodyBlocConsumer()
        : NoUserProfileView();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/functions/naviagtion_controler_after_login.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Widgets/sign_in_view_body.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/SignIn/sign_in_cubit.dart';
import 'package:ican_to/features/Home/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../functions/show_snack_bar.dart';

class SignInViewBodyBlockConsumer extends StatelessWidget {
  const SignInViewBodyBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          showSnackBar(state.errorMessage, context);
        }
        if (state is SignInSuccess) {
          if (state.provider == "google") {
            navigationControler(context, state.data);
            showSnackBar("Login is completed", context);
          } else {
            showSnackBar("Login is completed ", context);
            Navigator.pushReplacementNamed(context, HomeView.id);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignInLoading ? true : false,
            child: const SignInViewBody());
      },
    );
  }
}

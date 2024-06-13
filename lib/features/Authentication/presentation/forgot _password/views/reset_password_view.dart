import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/service_locator.dart';
import 'package:ican_to/core/widgets/custom_app_bar_logo.dart';
import 'package:ican_to/core/widgets/custom_app_barr.dart';
import 'package:ican_to/core/widgets/custom_app_logo.dart';
import 'package:ican_to/features/Authentication/data/Models/repos/auth_repo_impl.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/reset_password/reset_password_cubit.dart';
import '../Widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const id = "reset password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        rightpart: CustomAppBarLogo(),
        paddingTop: 16,
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
        child: const ResetPasswordViewBody(),
      )),
    );
  }
}

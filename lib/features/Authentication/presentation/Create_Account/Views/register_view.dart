import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/service_locator.dart';
import 'package:ican_to/core/widgets/custom_app_bar_logo.dart';
import 'package:ican_to/core/widgets/custom_app_barr.dart';
import 'package:ican_to/core/widgets/custom_app_logo.dart';
import 'package:ican_to/features/Authentication/data/Models/repos/auth_repo_impl.dart';
import 'package:ican_to/features/Authentication/presentation/Create_Account/Widgets/register_view_body_blocconsumer.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/Register/register_cubit.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/registerApi/register_api_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const id = "registerview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          paddingTop: 19,
          rightpart: CustomAppBarLogo(),
        ),
        body: SafeArea(
            child: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterViewBodyBlocConsumer(),
        )));
  }
}

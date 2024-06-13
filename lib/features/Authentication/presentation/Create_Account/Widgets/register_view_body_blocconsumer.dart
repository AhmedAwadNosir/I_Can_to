import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Authentication/presentation/Create_Account/Views/sucess_account_ilstration.dart';
import 'package:ican_to/features/Authentication/presentation/Create_Account/Widgets/register_view_body.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/Register/register_cubit.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/registerApi/register_api_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showSnackBar(state.errorMessaage, context);
        }
        if (state is RegisterSuccess) {
          showSnackBar("Registraion Completed Successfuly", context);
          Navigator.pushReplacementNamed(
              context, SuccessAcountIlstrationView.id);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is RegisterLoading ? true : false,
            child: const RegisterViewBody());
      },
    );
  }
}

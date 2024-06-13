import 'package:flutter/material.dart';
import 'package:ican_to/core/widgets/custom_app_bar_logo.dart';
import 'package:ican_to/core/widgets/custom_app_barr.dart';
import '../Widgets/success_account_view_body.dart';

class SuccessAcountIlstrationView extends StatelessWidget {
  const SuccessAcountIlstrationView({super.key});
  static const id = "Success Account";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        paddingTop: 16,
        rightpart: CustomAppBarLogo(),
      ),
      body: SafeArea(child: SuccessAccountIlsrationViewBody()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ican_to/core/widgets/custom_app_bar_logo.dart';
import 'package:ican_to/core/widgets/custom_app_barr.dart';
import 'package:ican_to/core/widgets/custom_app_logo.dart';

import '../Widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const id = "forgotPasswordView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        rightpart: CustomAppBarLogo(),
        paddingTop: 16,
      ),
      body: SafeArea(child: ForgotPasswordViewBody()),
    );
  }
}

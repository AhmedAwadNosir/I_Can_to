import 'package:flutter/material.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/Widgets/check_emial_view_body.dart';

class CheckEmialView extends StatelessWidget {
  const CheckEmialView({super.key});
  static const id = "checkemial";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CheckEmialViewBody()),
    );
  }
}

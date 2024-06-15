import 'package:flutter/material.dart';
import 'package:ican_to/features/aboutUs/widgets/about_program_view_body.dart';

class AboutProgramView extends StatelessWidget {
  const AboutProgramView({super.key});
  static String id = "AboutProgramView ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Program ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: const AboutProgramViewBody(),
    );
  }
}

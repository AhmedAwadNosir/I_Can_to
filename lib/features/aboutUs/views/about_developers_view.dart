import 'package:flutter/material.dart';
import 'package:ican_to/features/aboutUs/widgets/about_developers_view_body.dart';

class AboutDevelopersView extends StatelessWidget {
  const AboutDevelopersView({super.key});
  static String id = "AboutDevelopersView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Developers ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: const AboutDevelopersViewBody(),
    );
  }
}

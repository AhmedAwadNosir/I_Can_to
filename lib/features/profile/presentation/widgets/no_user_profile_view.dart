import 'package:flutter/material.dart';
import 'package:ican_to/Core/Utils/constans.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoUserProfileView extends StatelessWidget {
  const NoUserProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Image(image: AssetImage(AppImages.logo2copy1)),
        const SizedBox(
          height: 40,
        ),
        const Image(image: AssetImage(AppImages.noUser)),
        const SizedBox(
          height: 10,
        ),
        const Text.rich(
          TextSpan(
            text: 'Anonymous',
            style: TextStyle(
                color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                text: ' User !',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        const Text(
          "Please Sign In ..",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  side: const BorderSide(
                      color:
                          Color(0xff3CC563)), // Specify the border color here
                ),
              ),
            ),
            onPressed: () async {
              //Logic Here
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(loginSkiped);
              Navigator.pushReplacementNamed(context, SignInView.id);
            },
            child: const Text(
              "Sign In",
              style: TextStyle(color: Color(0xff3CC563), fontSize: 16),
            ))
      ],
    );
  }
}

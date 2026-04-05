import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductorySection extends StatelessWidget {
  const IntroductorySection({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            (userName == "" || userName == Null)
                ? "Hi , User Name👋"
                : "Hi , ${userName[0].toUpperCase() + userName.substring(1)}👋",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          (auth.currentUser == null)
              ? ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: const BorderSide(
                            color: Color(
                                0xff3CC563)), // Specify the border color here
                      ),
                    ),
                  ),
                  onPressed: () async {
                    //Logic Here
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove(loginSkiped);
                    Navigator.pushReplacementNamed(context, SignInView.id);
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Color(0xff3CC563), fontSize: 16),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

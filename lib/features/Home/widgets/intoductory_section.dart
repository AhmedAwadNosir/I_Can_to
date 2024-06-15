
import 'package:flutter/material.dart';

class IntroductorySection extends StatelessWidget {
  const IntroductorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const Text(
            "Hi , User Name👋",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
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
              onPressed: () {
                //Logic Here
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Color(0xff3CC563), fontSize: 16),
              ))
        ],
      ),
    );
  }
}

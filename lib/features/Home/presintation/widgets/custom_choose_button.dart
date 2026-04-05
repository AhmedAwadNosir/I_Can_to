import 'package:flutter/material.dart';

class CustomChooseButton extends StatelessWidget {
  const CustomChooseButton({
    super.key,
    required this.buttonLable,
    required this.onPressed,
  });
  final String buttonLable;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            minimumSize: WidgetStateProperty.all<Size>(const Size(300, 100)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Text(
            buttonLable,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          )),
    );
  }
}

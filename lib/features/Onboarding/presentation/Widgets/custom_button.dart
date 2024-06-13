import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';

import '../../../../Core/Utils/app_colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    this.buttonName,
    this.islastPage,
    this.buttonColor,
    this.textButtonColor,
    this.buttonchild,
  });
  final void Function()? onPressed;
  final String? buttonName;
  bool? islastPage = false;
  final Color? buttonColor;
  final Color? textButtonColor;
  final Widget? buttonchild;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: buttonColor ?? const Color(0xff3cc563),
      ),
      child: buttonchild ??
          Text(
            islastPage ?? false ? "Get Started" : buttonName!,
            style: AppFontsStyles.textstyle16
                .copyWith(color: textButtonColor ?? Colors.white),
          ),
    );
  }
}

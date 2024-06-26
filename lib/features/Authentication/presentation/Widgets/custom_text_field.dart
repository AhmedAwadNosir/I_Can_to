import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Core/Utils/app_colors.dart';
import '../../../../Core/Utils/app_fonts_styles.dart';
import '../../../../Core/Utils/constans.dart';
import '../../functions/text_field_border_decoration.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixicon,
    this.suffixicon,
    required this.obscureText,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmited,
    this.validator,
    this.autovalidateMode,
    this.helperText,
    this.helperStyle,
    this.contentPading,
  });
  final String hintText;
  final Widget? prefixicon;
  final double? contentPading;
  Widget? suffixicon;
  bool obscureText;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmited;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? helperText;
  final TextStyle? helperStyle;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      focusNode: focusNode,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmited,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      style: AppFontsStyles.textstyle14.copyWith(
        fontFamily: textFamilyMedium,
        color: AppColors.appNeutralColors900,
      ),
      decoration: InputDecoration(
        helperText: widget.helperText,
        helperStyle: widget.helperStyle,
        prefixIcon: widget.prefixicon,
        suffixIcon: widget.suffixicon != null
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                child: widget.obscureText
                    ? widget.suffixicon
                    : const Icon(Iconsax.eye),
              )
            : null,
        prefixIconColor: focusNode.hasFocus
            ? AppColors.appNeutralColors900
            : AppColors.appNeutralColors300,
        suffixIconColor: focusNode.hasFocus
            ? AppColors.appNeutralColors900
            : AppColors.appNeutralColors300,
        errorStyle: AppFontsStyles.textstyle16
            .copyWith(color: AppColors.appInDangerColors500),
        hintText: widget.hintText,
        hintStyle: AppFontsStyles.textstyle14.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.appNeutralColors400,
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: widget.contentPading ?? 25),
        border: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedErrorBorder: buildErrorBorders(),
        errorBorder: buildErrorBorders(),
        focusedBorder: buildFocusedBorder(),
      ),
    );
  }
}

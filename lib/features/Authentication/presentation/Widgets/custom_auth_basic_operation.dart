import 'package:flutter/material.dart';
import 'package:ican_to/core/widgets/custom_check_box.dart';
import 'package:ican_to/features/Authentication/presentation/forgot%20_password/views/forgot_password_view.dart';
import '../../../../Core/Utils/app_colors.dart';
import '../../../../Core/Utils/app_fonts_styles.dart';

class CustomAuthBasicOperation extends StatefulWidget {
  const CustomAuthBasicOperation({
    super.key,
  });

  @override
  State<CustomAuthBasicOperation> createState() =>
      _CustomAuthBasicOperationState();
}

class _CustomAuthBasicOperationState extends State<CustomAuthBasicOperation> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked),
        const SizedBox(
          width: 6,
        ),
        Text(
          "Remember me",
          style: AppFontsStyles.textstyle14
              .copyWith(color: AppColors.appNeutralColors800),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordView.id);
          },
          child: Text(
            "Forgot Password?",
            style: AppFontsStyles.textstyle14
                .copyWith(color: AppColors.appPrimaryColors500),
          ),
        )
      ],
    );
  }
}

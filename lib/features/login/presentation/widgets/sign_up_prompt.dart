import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key, required this.onSignUpPressed});

  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          UiStrings.dontHaveAccount,
          style: TextStyle(fontSize: 16.sp, color: textColor),
        ),
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: onSignUpPressed,
          child: Text(
            UiStrings.signUp,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

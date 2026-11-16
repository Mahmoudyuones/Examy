import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_ui/material_ui.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme
            .copyWith(centerTitle: false)
            .centerTitle,
        title: Text(
          AppStrings.password,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w),
              child: Column(
                children: [
                  Gap(40.h),
                  Text(
                    AppStrings.forgetPassword,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme
                          .copyWith(
                            titleLarge: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                          .titleLarge
                          ?.fontSize,
                    ),
                  ),
                  Gap(16.h),
                  Text(
                    textAlign: TextAlign.center,
                    AppStrings.pleaseeEnterYourEmailAssociatedToYourAccount,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme
                          .copyWith(
                            bodyMedium: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                          )
                          .bodyMedium
                          ?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

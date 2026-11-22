import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_ui/material_ui.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Column(
        children: [
          Gap(40.h),
          Text(title, style: textTheme.titleLarge),
          Gap(16.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          Gap(48.h),
        ],
      ),
    );
  }
}

import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/theme/app_colors.dart';
import 'package:examy_app/features/auth/forget_password/presentation/widgets/auth_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _pinController = TextEditingController();
  bool _hasError = false;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _verify(String code) {
    // TODO: call cubit/repo; on failure:
    setState(() => _hasError = true);
  }

  void _resend() {
    // TODO: call resend API
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final defaultPinTheme = PinTheme(
      width: 64.w,
      height: 64.h,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: BoxDecoration(
        color: AppColors.primaryLight, // light blue fill
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.transparent,
      border: Border.all(color: colors.error),
    );

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.password)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const AuthHeader(
                title: AppStrings.emailVerification,
                subtitle: AppStrings.pleaseEnterYourCode,
              ),
              Pinput(
                length: 4,
                controller: _pinController,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: defaultPinTheme,
                errorPinTheme: errorPinTheme,
                forceErrorState: _hasError,
                errorText: AppStrings.invalidCode,
                errorBuilder: (errorText, pin) => Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 14.sp,
                          color: colors.error,
                        ),
                        Gap(4.w),
                        Text(
                          errorText ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colors.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onChanged: (_) {
                  if (_hasError) setState(() => _hasError = false);
                },
                onCompleted: _verify,
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.didntReceiveCode),
                  Gap(4.w),
                  InkWell(
                    onTap: _resend,
                    child: Text(
                      AppStrings.resend,
                      style: TextStyle(
                        color: colors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

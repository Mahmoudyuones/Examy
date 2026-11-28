import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/theme/app_colors.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_event.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_state.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/reset_password_screen.dart';
import 'package:examy_app/features/auth/forget_password/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pinput/pinput.dart';

class ResetCodeScreen extends StatefulWidget {
  const ResetCodeScreen({super.key, this.email});

  final String? email;

  @override
  State<ResetCodeScreen> createState() => _ResetCodeScreenState();
}

class _ResetCodeScreenState extends State<ResetCodeScreen> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _verify(String code) {
    context.read<ResetCodeViewModel>().doEvent(EmailVerification(code: code));
  }

  void _resend() {
    if (widget.email != null) {
      _pinController.clear();
      context.read<ResetCodeViewModel>()
        ..reset()
        ..doEvent(ResendCode(email: widget.email!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final defaultPinTheme = PinTheme(
      width: 64.w,
      height: 64.h,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
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
              BlocConsumer<ResetCodeViewModel, ResetCodeState>(
                listenWhen: (previous, current) =>
                    previous.verifyCodeState != current.verifyCodeState,
                listener: (context, state) {
                  final s = state.verifyCodeState;
                  if (s.data == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(AppStrings.codeVerified)),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResetPasswordScreen(email: widget.email),
                      ),
                    );
                  } else if (s.errorMessage != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(s.errorMessage!)));
                  }
                },
                builder: (context, state) {
                  final isLoading = state.verifyCodeState.isLoading;
                  final isError = state.verifyCodeState.errorMessage != null;

                  return Pinput(
                    enabled: !isLoading,
                    length: 4,
                    controller: _pinController,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    defaultPinTheme: defaultPinTheme,
                    errorPinTheme: errorPinTheme,
                    forceErrorState: isError,
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
                      if (isError) {
                        context.read<ResetCodeViewModel>().reset();
                      }
                    },

                    onCompleted: _verify,
                  );
                },
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.didntReceiveCode),
                  Gap(4.w),
                  BlocConsumer<ResetCodeViewModel, ResetCodeState>(
                    listenWhen: (previous, current) =>
                        previous.resendCodeState != current.resendCodeState,
                    listener: (context, state) {
                      final s = state.resendCodeState;
                      if (s.data == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(AppStrings.codeSent)),
                        );
                      } else if (s.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(s.errorMessage!)),
                        );
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state.resendCodeState.isLoading;

                      return isLoading
                          ? const Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: _resend,
                              child: Text(
                                AppStrings.resend,
                                style: TextStyle(
                                  color: colors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            );
                    },
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

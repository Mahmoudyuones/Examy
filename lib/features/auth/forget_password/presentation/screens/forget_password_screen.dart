import 'package:examy_app/config/router/app_routes.dart';
import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/validators/app_validators.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_event.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_state.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (!_formKey.currentState!.validate()) return;
    context.read<ForgetPasswordViewModel>().doEvent(
      SendEmail(email: _emailController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.password)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const AuthHeader(
                  title: AppStrings.forgetPassword,
                  subtitle:
                      AppStrings.pleaseEnterYourEmailAssociatedToYourAccount,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                  ),
                ),
                Gap(48.h),
                BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
                  listenWhen: (previous, current) =>
                      previous.forgetPasswordState !=
                      current.forgetPasswordState,
                  listener: (context, state) {
                    final s = state.forgetPasswordState;
                    if (s.data == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppStrings.passwordResetEmailSent),
                        ),
                      );
                      context.go(
                        AppRoutes.resetPassword,
                        extra: _emailController.text.trim(),
                      );
                    } else if (s.errorMessage != null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(s.errorMessage!)));
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state.forgetPasswordState.isLoading;
                    return ElevatedButton(
                      onPressed:
                          Validators.isEmail(_emailController.text.trim())
                          ? _onContinue
                          : null,
                      child: isLoading
                          ? SizedBox(
                              height: 20.h,
                              width: 20.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(AppStrings.continuee),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

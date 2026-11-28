import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/validators/app_validators.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_password_cubit/reset_password_event.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_password_cubit/reset_password_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:material_ui/material_ui.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String? email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (!_formKey.currentState!.validate()) return;
    context.read<ResetPasswordViewModel>().doEvent(
      ResetPassword(
        email: widget.email!,
        newPassword: _passwordController.text.trim(),
      ),
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
                  title: AppStrings.resetPassword,
                  subtitle: AppStrings.passwordRules,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: Validators.password,
                  decoration: const InputDecoration(
                    labelText: AppStrings.newPassword,
                    hintText: AppStrings.enterYourPassword,
                  ),
                ),
                Gap(24.h),
                TextFormField(
                  controller: _confirmController,
                  obscureText: true,
                  validator: (v) => v == _passwordController.text
                      ? null
                      : AppStrings.passwordsDontMatch,
                  decoration: const InputDecoration(
                    labelText: AppStrings.confirmPassword,
                    hintText: AppStrings.confirmPassword,
                  ),
                ),
                Gap(32.h),
                BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
                  listenWhen: (previous, current) =>
                      previous.resetPasswordState != current.resetPasswordState,
                  listener: (context, state) {
                    final s = state.resetPasswordState;
                    if (s.data == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppStrings.passwordResetSuccess),
                        ),
                      );
                      // TODO: Navigate to login screen
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state.resetPasswordState.isLoading;
                    return ElevatedButton(
                      onPressed: _onContinue,
                      child: isLoading
                          ? const CircularProgressIndicator()
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

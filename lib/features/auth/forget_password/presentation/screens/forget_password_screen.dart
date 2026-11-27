import 'package:examy_app/config/di/di.dart';
import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/validators/app_validators.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_event.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_state.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/reset_code_screen.dart';
import 'package:examy_app/features/auth/forget_password/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
                  onChanged: (_) => setState(() {}), // refresh button state
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                  ),
                ),
                Gap(48.h),
                BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppStrings.passwordResetEmailSent),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => getIt<ResetCodeViewModel>(),
                              child: const EmailVerificationScreen(),
                            ),
                          ),
                        );
                      },
                      error: (errMessage) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(errMessage)));
                      },
                    );
                  },
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
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

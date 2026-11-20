import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/validators/app_validators.dart';
import 'package:examy_app/features/auth/forget_password/presentation/widgets/auth_header.dart';
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
                ElevatedButton(
                  onPressed: Validators.isEmail(_emailController.text)
                      ? _onContinue
                      : null,
                  child: const Text(AppStrings.continuee),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

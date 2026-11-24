import 'package:examy_app/config/di/di.dart';
import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:examy_app/core/theme/dialog_utils.dart';
import 'package:examy_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:examy_app/features/login/presentation/cubit/login_events.dart';
import 'package:examy_app/features/login/presentation/cubit/login_states.dart';
import 'package:examy_app/features/login/presentation/widgets/email_field.dart';
import 'package:examy_app/features/login/presentation/widgets/password_field.dart';
import 'package:examy_app/features/login/presentation/widgets/sign_up_prompt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final LoginCubit _loginCubit = getIt<LoginCubit>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginCubit.close();
    super.dispose();
  }

  void _onLogin() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _loginCubit.onEvent(
      LoginSubmittedEvent(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }

  void _onSignUp() {
    //  navigate to sign up screen.
  }

  void _onStateChanged(BuildContext context, LoginState state) {
    if (state.isLoading) {
      DialogUtils.showLoading(context);
      return;
    }

    DialogUtils.hideLoading(context);

    if (state.errMsg != null) {
      DialogUtils.showMessage(context, state.errMsg!);
    } else if (state.isSuccess) {
      // Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>.value(
      value: _loginCubit,
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.errMsg != current.errMsg ||
            previous.isSuccess != current.isSuccess,
        listener: _onStateChanged,
        child: Scaffold(
          appBar: AppBar(title: const Text(UiStrings.login)),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    EmailField(controller: _emailController),
                    SizedBox(height: 24.h),
                    PasswordField(controller: _passwordController),
                    SizedBox(height: 16.h),
                    //  replace with RememberMeRow once remember-me is built
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: ForgotPasswordButton(
                    //     onPressed: _onForgotPassword,
                    //   ),
                    // ),
                    SizedBox(height: 48.h),
                    ElevatedButton(
                      onPressed: _onLogin,
                      child: const Text(UiStrings.login),
                    ),
                    SizedBox(height: 16.h),
                    SignUpPrompt(onSignUpPressed: _onSignUp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

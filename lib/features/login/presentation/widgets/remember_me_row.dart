import 'package:examy_app/features/login/presentation/widgets/forget_password_button.dart';
import 'package:examy_app/features/login/presentation/widgets/remember_me_check_box.dart';
import 'package:material_ui/material_ui.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onForgotPassword,
  });

  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeCheckbox(value: rememberMe, onChanged: onRememberMeChanged),
        ForgotPasswordButton(onPressed: onForgotPassword),
      ],
    );
  }
}

import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:material_ui/material_ui.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.controller});

  final TextEditingController controller;

  String? _validate(String? value) {
    if (value == null || value.isEmpty) return UiStrings.passwordRequired;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      textInputAction: TextInputAction.done,
      validator: _validate,
      decoration: const InputDecoration(
        labelText: UiStrings.password,
        hintText: UiStrings.passwordHint,
      ),
    );
  }
}

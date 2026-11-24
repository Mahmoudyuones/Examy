import 'package:examy_app/core/constants/ui_strings.dart';
import 'package:material_ui/material_ui.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller});

  final TextEditingController controller;

  static final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  String? _validate(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return UiStrings.emailRequired;
    if (!_emailRegex.hasMatch(email)) return UiStrings.emailInvalid;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validate,
      decoration: const InputDecoration(
        labelText: UiStrings.email,
        hintText: UiStrings.emailHint,
      ),
    );
  }
}

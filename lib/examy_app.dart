import 'package:examy_app/core/theme/main_theme.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:material_ui/material_ui.dart';

class ExamyApp extends StatelessWidget {
  const ExamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: const ForgetPasswordScreen(),
    );
  }
}

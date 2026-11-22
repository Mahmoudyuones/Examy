import 'package:examy_app/config/di/di.dart';
import 'package:examy_app/core/theme/main_theme.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/email_verification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class ExamyApp extends StatelessWidget {
  const ExamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Examy',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light as ThemeData?,
          darkTheme: AppTheme.dark as ThemeData?,
          themeMode: ThemeMode.light,
          home: BlocProvider(
            create: (context) => getIt<ResetCodeViewModel>(),
            child: const EmailVerificationScreen(),
          ),
        );
      },
    );
  }
}

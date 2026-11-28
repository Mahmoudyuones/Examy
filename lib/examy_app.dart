import 'package:examy_app/config/router/app_router.dart';
import 'package:examy_app/core/theme/main_theme.dart';
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
        return MaterialApp.router(
          title: 'Examy',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light as ThemeData?,
          darkTheme: AppTheme.dark as ThemeData?,
          themeMode: ThemeMode.light,
          routerConfig: appRouter,
        );
      },
    );
  }
}

import 'package:examy_app/config/router/app_router.dart';
import 'package:examy_app/config/router/app_routes.dart';

import 'package:examy_app/core/theme/main_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

void main() => runApp(const ExamyApp());

class ExamyApp extends StatelessWidget {
  const ExamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(382, 792), // use your Figma frame size
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        initialRoute: AppRoutes.login, // default route
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

import 'package:examy_app/config/router/app_routes.dart';
import 'package:examy_app/features/login/presentation/screens/login_screen.dart';
import 'package:material_ui/material_ui.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: SizedBox.shrink()),
        );
    }
  }
}

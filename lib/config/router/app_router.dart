import 'package:examy_app/config/di/di.dart';
import 'package:examy_app/config/router/app_routes.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_view_model.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/reset_code_screen.dart';
import 'package:examy_app/features/auth/forget_password/presentation/screens/reset_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.forgetPassword,
  debugLogDiagnostics: true,
  routes: [
    // GoRoute(
    //   path: '/login',
    //   name: 'login',
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: '/',
    //   name: 'home',
    //   builder: (context, state) => const HomeScreen(),
    // ),

    GoRoute(
      path: AppRoutes.forgetPassword,
      name: 'forgetPassword',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ForgetPasswordViewModel>(),
        child: const ForgetPasswordScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.emailVerification,
      name: 'emailVerification',
      builder: (context, state) =>
          ResetCodeScreen(email: state.extra as String),
    ),
    GoRoute(
      path: AppRoutes.resetPassword,
      name: 'resetPassword',
      builder: (context, state) =>
          ResetPasswordScreen(email: state.extra as String),
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
);

import 'package:examy_app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_ui/material_ui.dart';

class AppTheme {
  AppTheme._();

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: color),
  );

  /// Shared by light & dark. Only the focused border color differs.
  static InputDecorationTheme _inputDecorationTheme(Color focusedColor) =>
      InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        labelStyle: TextStyle(fontSize: 12.sp, color: AppColors.grey),
        floatingLabelStyle: TextStyle(fontSize: 12.sp, color: AppColors.grey),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.grey.withValues(alpha: 0.6),
        ),
        border: _border(AppColors.grey),
        enabledBorder: _border(AppColors.grey),
        focusedBorder: _border(focusedColor),
        errorBorder: _border(AppColors.error),
        focusedErrorBorder: _border(AppColors.error),
        errorStyle: TextStyle(fontSize: 12.sp, color: AppColors.error),
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(52.h),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.grey,
          disabledForegroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          shape: const StadiumBorder(),
        ),
      );

  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      error: AppColors.error,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.background,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (_) => Icon(Icons.arrow_back_ios_new, size: 20.sp),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
    ),
    inputDecorationTheme: _inputDecorationTheme(AppColors.black),
    elevatedButtonTheme: _elevatedButtonTheme,
  );

  static ThemeData get dark => ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      error: AppColors.error,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.black,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (_) => Icon(Icons.arrow_back_ios_new, size: 20.sp),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    inputDecorationTheme: _inputDecorationTheme(Colors.white),
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}

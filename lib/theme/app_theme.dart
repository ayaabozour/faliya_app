import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_app/theme/button_theme/app_button_theme.dart';
import 'package:show_up_app/theme/color/color_manager.dart';
import 'package:show_up_app/theme/size/app_size.dart';
import 'package:show_up_app/theme/text_theme/text_font_size.dart';
import 'package:show_up_app/theme/text_theme/text_manager.dart';
import 'package:show_up_app/theme/text_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static AppTheme instance = AppTheme._();

  ThemeData get lightTheme {
    return ThemeData(
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(
          ColorManager.instance.primaryColor,
        ),
      ),
      primaryColor: ColorManager.instance.primaryColor,
      hintColor: ColorManager.instance.primaryColor,
      colorScheme: ColorScheme.light(
        primary: ColorManager.instance.primaryColor,
        surface: ColorManager.instance.scaffoldColor,
        secondary: ColorManager.instance.secondaryColor,
        error: ColorManager.instance.error,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorManager.instance.primaryColor,
        primaryContrastingColor: ColorManager.instance.primaryColor,
      ),
      secondaryHeaderColor: ColorManager.instance.secondaryColor,
      scaffoldBackgroundColor: ColorManager.instance.scaffoldColor,
      dividerColor: ColorManager.instance.dividerColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.instance.white,
        iconTheme: IconThemeData(
          color: ColorManager.instance.primaryColor,
        ),
        titleTextStyle: GoogleFonts.lexend(
          textStyle: AppTextTheme.textAppTheme.headlineSmall?.copyWith(
            color: ColorManager.instance.primaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.instance.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme: GoogleFonts.lexendTextTheme(AppTextTheme.textAppTheme),
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.lexend(
          textStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        labelStyle: GoogleFonts.lexend(
          textStyle: AppTextTheme.textAppTheme.titleMedium?.copyWith(
            color: ColorManager.instance.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.error,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.instance.bottomNavigationBackgroundColor,
        selectedItemColor: ColorManager.instance.primaryColor,
        unselectedItemColor: ColorManager.instance.grayText,
        selectedLabelStyle: GoogleFonts.lexend(
          textStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.primaryColor,
            fontSize: TextFontSize.fontSize12,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.lexend(
          textStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.grayText,
            fontSize: TextFontSize.fontSize1,
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r12),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          ColorManager.instance.white,
        ),
        checkColor: WidgetStateProperty.all(
          ColorManager.instance.white,
        ),
        side: BorderSide(
          color: ColorManager.instance.grayText,
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          ColorManager.instance.white,
        ),
        trackColor: WidgetStateProperty.all(
          ColorManager.instance.primaryColor,
        ),
        trackOutlineColor: WidgetStateColor.resolveWith(
          (states) => ColorManager.instance.grayText,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.instance.primaryColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ColorManager.instance.primaryColor,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorManager.instance.backgroundColor,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(
          ColorManager.instance.primaryColor,
        ),
      ),
      primaryColor: ColorManager.instance.primaryColor,
      hintColor: ColorManager.instance.primaryColor,
      colorScheme: ColorScheme.dark(
        primary: ColorManager.instance.primaryColor,
        surface: ColorManager.instance.backgroundColorDark,
        secondary: ColorManager.instance.secondaryColor,
        error: ColorManager.instance.error,
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorManager.instance.primaryColor,
        primaryContrastingColor: ColorManager.instance.primaryColor,
      ),
      secondaryHeaderColor: ColorManager.instance.secondaryColor,
      scaffoldBackgroundColor: ColorManager.instance.backgroundColorDark,
      dividerColor: ColorManager.instance.dividerColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.instance.black,
        iconTheme: IconThemeData(
          color: ColorManager.instance.primaryColor,
        ),
        titleTextStyle: GoogleFonts.lexend(
          textStyle: AppTextTheme.textAppTheme.headlineSmall?.copyWith(
            color: ColorManager.instance.primaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.instance.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: GoogleFonts.lexendTextTheme(AppTextTheme.textAppTheme),
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.lexend(
          textStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.backgroundColorDark,
            fontWeight: FontWeight.w500,
          ),
        ),
        labelStyle: GoogleFonts.lexend(
          textStyle: AppTextTheme.textAppTheme.titleMedium?.copyWith(
            color: ColorManager.instance.backgroundColorDark,
            fontWeight: FontWeight.w500,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.error,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.instance.bottomNavigationBackgroundColor,
        selectedItemColor: ColorManager.instance.primaryColor,
        unselectedItemColor: ColorManager.instance.grayText,
        selectedLabelStyle: GoogleFonts.lexend(
          textStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.primaryColor,
            fontSize: TextFontSize.fontSize12,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.lexend(
          textStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.grayText,
            fontSize: TextFontSize.fontSize1,
          ),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r12),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          ColorManager.instance.backgroundColorDark,
        ),
        checkColor: WidgetStateProperty.all(
          ColorManager.instance.backgroundColorDark,
        ),
        side: BorderSide(
          color: ColorManager.instance.grayText,
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          ColorManager.instance.backgroundColorDark,
        ),
        trackColor: WidgetStateProperty.all(
          ColorManager.instance.primaryColor,
        ),
        trackOutlineColor: WidgetStateColor.resolveWith(
          (states) => ColorManager.instance.grayText,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.instance.primaryColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ColorManager.instance.primaryColor,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorManager.instance.backgroundColorDark,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:show_up_app/theme/color/color_manager.dart';
import 'package:show_up_app/theme/text_theme/text_manager.dart';

abstract class AppTextTheme {
  static TextTheme textAppTheme = TextTheme(
    displayMedium: TextManager.headline1,
    displaySmall: TextManager.headline2,
    headlineMedium: TextManager.headline3,
    headlineSmall: TextManager.headline4,
    titleLarge: TextManager.headline5,
    titleMedium: TextManager.headline6,
    titleSmall: TextManager.subTitle1,
    bodyLarge: TextManager.subTitle2,
    bodyMedium: TextManager.textBody1,
    bodySmall: TextManager.textBody2,
  );

  static TextTheme textAppThemeDark = TextTheme(
    displayMedium: TextManager.headline1.copyWith(
      color: ColorManager.instance.white,
    ),
    displaySmall: TextManager.headline2.copyWith(
      color: ColorManager.instance.white,
    ),
    headlineMedium: TextManager.headline3.copyWith(
      color: ColorManager.instance.white,
    ),
    headlineSmall: TextManager.headline4.copyWith(
      color: ColorManager.instance.white,
    ),
    titleLarge: TextManager.headline5.copyWith(
      color: ColorManager.instance.white,
    ),
    titleMedium: TextManager.headline6.copyWith(
      color: ColorManager.instance.white,
    ),
    titleSmall: TextManager.subTitle1.copyWith(
      color: ColorManager.instance.white,
    ),
    bodyLarge: TextManager.subTitle2.copyWith(
      color: ColorManager.instance.white,
    ),
    bodyMedium: TextManager.textBody1.copyWith(
      color: ColorManager.instance.white,
    ),
    bodySmall: TextManager.textBody2.copyWith(
      color: ColorManager.instance.white,
    ),
  );
}

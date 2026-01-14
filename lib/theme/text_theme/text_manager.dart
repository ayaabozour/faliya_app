import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_app/theme/color/color_manager.dart';
import 'package:show_up_app/theme/text_theme/text_font_size.dart';

abstract class TextManager {
  static TextStyle get inputTheme => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.black,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle get headline1 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize34,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get headline2 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize28,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get headline3 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize24,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get headline4 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize20,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get headline5 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize16,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get headline6 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize12,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get subTitle1 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize17,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get subTitle2 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textBodyColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize12,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get textBody1 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textBodyColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize16,
      overflow: TextOverflow.ellipsis,
    ),
  );

  static TextStyle get textBody2 => GoogleFonts.lexend(
    textStyle: TextStyle(
      color: ColorManager.instance.textBodyColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize14,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

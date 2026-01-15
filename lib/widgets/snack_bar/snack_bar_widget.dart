import 'package:flutter/material.dart';
import 'package:show_up_app/theme/color/color_manager.dart';

class SnackBarWidget {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    Color backgroundColor = const Color(0xFF303030),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          maxLines: 4,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void successSnackBar(BuildContext context, {required String message}) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: ColorManager.instance.green,
    );
  }

  static void errorSnackBar(BuildContext context, {required String message}) {
    showSnackBar(
      context,
      message: message,
      backgroundColor: ColorManager.instance.error,
    );
  }
}

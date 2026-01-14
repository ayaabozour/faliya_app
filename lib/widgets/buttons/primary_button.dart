import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_app/widgets/loading/loading_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.isLoading = false,
    this.hasBorder = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool isLoading;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor:
              backgroundColor ??
              (hasBorder
                  ? theme.colorScheme.surface
                  : theme.colorScheme.onSurface),
          foregroundColor: hasBorder
              ? theme.colorScheme.onSurface
              : theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 28),
            side: hasBorder
                ? BorderSide(color: theme.colorScheme.onSurface, width: 1)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? LoadingWidget(size: 6.h)
            : Text(
                text,
                style:
                    textStyle ??
                    theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: hasBorder
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.surface,
                    ),
              ),
      ),
    );
  }
}

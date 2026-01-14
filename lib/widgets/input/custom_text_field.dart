import 'package:flutter/material.dart';
import 'package:show_up_app/theme/size/app_size.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.isNumbers = false,
    this.isEmail = false,
    this.isPassword = false,
    this.isHiddenPassword = false,
    this.isPhoneNumber = false,
    this.controller,
    this.validator,
    this.icon,
    this.onEyeTap,
    this.onChanged,
    this.hint,
    required this.label,
    this.contentPadding,
    this.isDate = false,
    this.isDatePicker = false,
    this.showhDatepicker,
    this.isHasLabel = true,
  });

  final bool isNumbers;
  final bool isEmail;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isHiddenPassword;
  final TextEditingController? controller;
  final Function(String? value)? validator;
  final Widget? icon;
  final Function? onEyeTap;
  final void Function(String)? onChanged;
  final String? hint;
  final String label;
  final EdgeInsetsGeometry? contentPadding;
  final bool isDate;
  final bool? isDatePicker;
  final Function()? showhDatepicker;
  final bool? isHasLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isHasLabel == true) ...[
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
          SizedBox(height: AppSize.h10),
        ],
        TextFormField(
          controller: controller,
          obscureText: isHiddenPassword,
          readOnly: isDatePicker == true,
          onChanged: onChanged,
          validator: (e) => validator != null ? validator!(e) : null,
          keyboardType: isNumbers
              ? TextInputType.phone
              : isEmail
              ? TextInputType.emailAddress
              : TextInputType.text,
          onTap: isDatePicker == true ? showhDatepicker : null,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: icon,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () => onEyeTap?.call(),
                    icon: Icon(
                      isHiddenPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  )
                : null,
            hintText: hint ?? label,
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.6,
            ),
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: theme.colorScheme.onSurface,
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:show_up_app/theme/text_theme/text_font_size.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.isHasTitle = false, this.title});

  final bool isHasTitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Center(
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onSurface,
          size: TextFontSize.fontSize24,
        ),
      ),
    );
  }
}

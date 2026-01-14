import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiUtils {
  static const Size designSize =
      Size(392.72727272727275, 759.2727272727273);

  static void initScreenUtil(BuildContext context) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: designSize,
    );
  }

  static void setStatusBar({
    required Color color,
    required Brightness iconBrightness,
    Color? navigationColor,
    Brightness? navigationIconBrightness,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness,
        systemNavigationBarColor: navigationColor,
        systemNavigationBarIconBrightness: navigationIconBrightness,
      ),
    );
  }

  static ScrollPhysics bouncingScroll() {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}

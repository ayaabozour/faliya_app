import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_app/models/enums/account_type.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';
import 'package:show_up_app/widgets/bottom_nav/attender_bottom_nav.dart';
import 'package:show_up_app/widgets/bottom_nav/manager_bottom_nav.dart';


class HomePlaceholderScreen extends StatelessWidget {
  const HomePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userType = context.watch<SharedPrefsProvider>().userType;

    return userType == AccountType.owner
        ? const ManagerBottomNav()
        : const AttenderBottomNav();
  }
}

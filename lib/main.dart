import 'package:flutter/material.dart';
import 'package:show_up_app/app_widget.dart';
import 'package:show_up_app/providers/shared_prefs_provider.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefsProvider.instance.init();
  runApp(const AppWidget());
}

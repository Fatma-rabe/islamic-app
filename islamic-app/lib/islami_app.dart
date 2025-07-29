import 'package:flutter/material.dart';
import 'package:islamic_app/config/theme/theme_manager.dart';
import 'package:islamic_app/core/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.splash,
        theme: ThemeManager.light);
  }
}

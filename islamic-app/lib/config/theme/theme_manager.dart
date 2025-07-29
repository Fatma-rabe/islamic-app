import 'package:flutter/material.dart';
import 'package:islamic_app/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: ColorsManager.gold),
          backgroundColor: ColorsManager.black,
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsManager.gold)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.black,
        backgroundColor: ColorsManager.gold,
        type: BottomNavigationBarType.fixed,
      ));
}

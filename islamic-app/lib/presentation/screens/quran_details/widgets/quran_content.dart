import 'package:flutter/material.dart';
import 'package:islamic_app/core/colors_manager.dart';

class QuranContent extends StatelessWidget {
  const QuranContent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            color: ColorsManager.gold,
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';

class MostRecentSuraCard extends StatelessWidget {
  const MostRecentSuraCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.6,
      child: Card(
        color: ColorsManager.gold,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Al-Fatiha",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black),
                  ),
                  Text(
                    "الفاتحه",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black),
                  ),
                  Text(
                    "7 Verses ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black),
                  )
                ],
              ),
            ),
            Expanded(child: Image.asset(AssetsManager.mostRecentCardImage))
          ],
        ),
      ),
    );
  }
}

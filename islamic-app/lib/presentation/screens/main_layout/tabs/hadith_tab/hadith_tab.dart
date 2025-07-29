import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/hadith_tab/widgets/hadith_card.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.hadithTabBackground)),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(AssetsManager.islamiLogo)),
          Expanded(
            flex: 4,
            child: CarouselSlider(
                options: CarouselOptions(
                  height: 600.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: List.generate(
                  50,
                  (index) => index + 1,
                )
                    .map(
                      (index) => HadithCard(index: index),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}

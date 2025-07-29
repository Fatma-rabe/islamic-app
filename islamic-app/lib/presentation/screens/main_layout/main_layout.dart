import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/hadith_tab/hadith_tab.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/quran_tab/quran_tab.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/tasbeh_tab/tasbeh_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selecteIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsManager.black.withOpacity(0),
              ColorsManager.black,
            ]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: tabs[selecteIndex],
          bottomNavigationBar: buildBottomNavBar()),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: selecteIndex,
        onTap: onItemClicked,
        items: [
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 0,
                  iconPath: AssetsManager.quranIcon),
              label: "Quran"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 1,
                  iconPath: AssetsManager.hadithIcon),
              label: "Hadith"),
          BottomNavigationBarItem(
              icon: buildIcon(
                  isSelected: selecteIndex == 2,
                  iconPath: AssetsManager.sebhaIcon),
              label: "Tasbeh"),
        ]);
  }

  Widget buildIcon({required bool isSelected, required String iconPath}) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
                color: ColorsManager.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(66)),
            child: ImageIcon(AssetImage(iconPath)))
        : ImageIcon(AssetImage(iconPath));
  }

  void onItemClicked(int itemIndex) {
    setState(() {
      selecteIndex = itemIndex;
    });
  }
}

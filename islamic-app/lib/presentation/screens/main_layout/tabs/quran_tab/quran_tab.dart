import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';
import 'package:islamic_app/core/constant_manager.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/quran_tab/widgets/most_recent_suras.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/quran_tab/widgets/sura_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchKey = '';
  List<SuraDM> filteredSuras = [];
  GlobalKey<MostRecentSurasState> mostRecentKey =
      GlobalKey<MostRecentSurasState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AssetsManager.quranTabBackground))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetsManager.islamiLogo,
              ),
              const SizedBox(
                height: 20,
              ),
              buildSearchField(),
              const SizedBox(
                height: 20,
              ),
              MostRecentSuras(
                key: mostRecentKey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Suras List",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.ofWhite),
              ),
              const SizedBox(
                height: 14,
              ),
              buildSurasList(),
            ],
          ),
        ),
      ),
    );
  }

  void filterSurasList() {
    filteredSuras = ConstantManager.suraList;

    /// 114 sura
    filteredSuras = filteredSuras
        .where(
          (suraDM) =>
              suraDM.suraNameEn
                  .toLowerCase()
                  .contains(searchKey.toLowerCase()) ||
              suraDM.suraNameAr.contains(searchKey),
        )
        .toList();
  }

  Widget buildSurasList() {
    filterSurasList();

    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(
              indent: 64,
              endIndent: 64,
              thickness: 1,
              color: ColorsManager.white,
            ),
        itemBuilder: (context, index) => SuraItem(
              mostRecentKey: mostRecentKey,
              suraDM: filteredSuras[index],
            ),
        itemCount: filteredSuras.length);
  }

  // Widget buildMostRecentSuras() {
  //   return SizedBox(
  //     height: MediaQuery.sizeOf(context).height * 0.2,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) => MostRecentSuraCard(),
  //       itemCount: 7,
  //     ),
  //   );
  // }

  Widget buildSearchField() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.09,
      child: TextField(
        //ab
        onChanged: (userInput) {
          searchKey = userInput;
          setState(() {});
        },

        cursorColor: Colors.white,
        style: const TextStyle(
            fontSize: 18,
            color: ColorsManager.white,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: ImageIcon(
            AssetImage(AssetsManager.quranIcon),
            color: ColorsManager.gold,
          ),
          labelText: "Sura name",
          labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorsManager.ofWhite),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorsManager.gold, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorsManager.gold, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red, width: 1)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';
import 'package:islamic_app/core/constant_manager.dart';
import 'package:islamic_app/core/prefs_manager/prefs_manager.dart';
import 'package:islamic_app/core/routes_manager.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/quran_tab/widgets/sura_item.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => MostRecentSurasState();
}

class MostRecentSurasState extends State<MostRecentSuras> {
  List<SuraDM> mostRecentSuras = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshMostRecentSuras();
  }

  void refreshMostRecentSuras() async {
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return mostRecentSuras.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Most Recently",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.ofWhite),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      buildMostRecentCard(suraDM: mostRecentSuras[index]),
                  itemCount: mostRecentSuras.length,
                ),
              ),
              // buildMostRecentCard(suraDM: mostRecentSuras[0]),
            ],
          );
  }

  buildMostRecentCard({required SuraDM suraDM}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.quranDetails,
            arguments: QuranDetailsArguments(
              suraNameEn: suraDM.suraNameEn,
              suraNameAr: suraDM.suraNameAr,
              suraIndex: suraDM.suraIndex,
            ));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.7,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: ColorsManager.gold, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    suraDM.suraNameEn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black),
                  ),
                  Text(
                    suraDM.suraNameAr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black),
                  ),
                  Text(
                    "${suraDM.versesNumber} Verses",
                    textAlign: TextAlign.center,
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

import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';
import 'package:islamic_app/core/constant_manager.dart';
import 'package:islamic_app/core/prefs_manager/prefs_manager.dart';
import 'package:islamic_app/core/routes_manager.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/quran_tab/widgets/most_recent_suras.dart';

class SuraItem extends StatefulWidget {
  const SuraItem(
      {super.key, required this.suraDM, required this.mostRecentKey});

  final SuraDM suraDM;
  final GlobalKey<MostRecentSurasState> mostRecentKey;

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  void _onSuraItemClicked() {
    int suraIndex = int.parse(widget.suraDM.suraIndex) - 1;
    PrefsManager.addSuraIndex(suraIndex);
    Navigator.pushNamed(context, RoutesManager.quranDetails,
        arguments: QuranDetailsArguments(
            mostRecentKey: widget.mostRecentKey,
            suraNameEn: widget.suraDM.suraNameEn,
            suraNameAr: widget.suraDM.suraNameAr,
            suraIndex: widget.suraDM.suraIndex));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSuraItemClicked,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumberBackground),
              Text(
                "${widget.suraDM.suraIndex}",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            children: [
              Text(
                widget.suraDM.suraNameEn,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorsManager.white),
              ),
              Text(
                widget.suraDM.versesNumber,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorsManager.white),
              )
            ],
          ),
          Spacer(),
          Text(
            widget.suraDM.suraNameAr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorsManager.white),
          ),
        ],
      ),
    );
  }
}

class QuranDetailsArguments {
  final String suraNameEn;
  final String suraNameAr;
  final String suraIndex;
  final GlobalKey<MostRecentSurasState>? mostRecentKey;

  QuranDetailsArguments(
      {required this.suraNameEn,
      required this.suraNameAr,
      required this.suraIndex,
      this.mostRecentKey});
}

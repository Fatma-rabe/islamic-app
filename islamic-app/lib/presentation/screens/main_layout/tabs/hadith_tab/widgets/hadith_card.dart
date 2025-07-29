import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';
import 'package:islamic_app/core/routes_manager.dart';
import 'package:islamic_app/core/widgets/loading_widget.dart';
import 'package:islamic_app/presentation/screens/main_layout/tabs/hadith_tab/widgets/hadith_content.dart';

class HadithCard extends StatefulWidget {
  const HadithCard({super.key, required this.index});

  final int index;

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
  HadithDM? hadithDM;

  @override
  void initState() {
    super.initState();
    loadHadithContent(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.hadithDetails,
            arguments:
                HadithDetailsArgs(hadithDM: hadithDM!, index: widget.index));
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsManager.hadithCardBackground)),
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsManager.quranDetailsPatterLeft,
                      color: ColorsManager.black,
                    ),
                    Image.asset(
                      AssetsManager.quranDetailsPatterRight,
                      color: ColorsManager.black,
                    ),
                  ],
                ),
                hadithDM != null
                    ? Text(
                        hadithDM!.title,
                        style: const TextStyle(
                            fontSize: 21,
                            color: ColorsManager.black,
                            fontWeight: FontWeight.w600),
                      )
                    : Container(),
              ],
            ),
            Expanded(
              child: hadithDM != null
                  ? HadithContent(
                      content: hadithDM!.content,
                      contentColor: ColorsManager.black,
                    )
                  : const LoadingWidget(
                      color: ColorsManager.black,
                    ),
            ),
            Image.asset(AssetsManager.hadithCardBottom)
          ],
        ),
      ),
    );
  }

  void loadHadithContent(int index) async {
    String filePath = "assets/files/hadith/h$index.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = fileContent.split("\n");
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    String content = hadithLines.join();

    setState(() {
      hadithDM = HadithDM(title: title, content: content);
    });
  }
}

class HadithDetailsArgs {
  final HadithDM hadithDM;
  final int index;

  const HadithDetailsArgs({required this.hadithDM, required this.index});
}

class HadithDM {
  final String title;
  final String content;

  HadithDM({
    required this.title,
    required this.content,
  });
}

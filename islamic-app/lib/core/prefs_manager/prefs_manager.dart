import 'package:islamic_app/core/constant_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  ///  1   5
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void addSuraIndex(int suraIndex) async {
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras_index") ?? [];
    if (mostRecentSurasIndex.length > 6) {
      mostRecentSurasIndex.remove(mostRecentSurasIndex.first);
    }
    if (mostRecentSurasIndex.contains("$suraIndex")) {
      mostRecentSurasIndex.remove("$suraIndex");
      mostRecentSurasIndex.add("$suraIndex");
    } else {
      mostRecentSurasIndex.add("$suraIndex");
    }
    prefs.setStringList("most_recent_suras_index", mostRecentSurasIndex);
  }

  static Future<List<SuraDM>> getMostRecentSuras() async {
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras_index") ?? [];
    List<SuraDM> mostRecentSuras = [];
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int index = int.parse(mostRecentSurasIndex[i]);
      mostRecentSuras.add(ConstantManager.suraList[index]);
    }
    return mostRecentSuras.reversed.toList();
  }
}

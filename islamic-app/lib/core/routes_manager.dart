import 'package:flutter/cupertino.dart';
import 'package:islamic_app/presentation/screens/hadith_details/hadith_details.dart';
import 'package:islamic_app/presentation/screens/main_layout/main_layout.dart';
import 'package:islamic_app/presentation/screens/onboarding/onboarding.dart';
import 'package:islamic_app/presentation/screens/quran_details/quran_details.dart';
import 'package:islamic_app/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String quranDetails = "/quranDetails";
  static const String onboarding = "/onboarding";
  static const String hadithDetails = "/hadithDetails";
  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const Splash(),
    mainLayout: (_) => const MainLayout(),
    quranDetails: (_) => const QuranDetails(),
    onboarding: (_) => OnBoarding(),
    hadithDetails: (_) => HadithDetails(),
  };
}

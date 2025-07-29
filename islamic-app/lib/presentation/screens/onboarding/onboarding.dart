import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/colors_manager.dart';
import 'package:islamic_app/core/routes_manager.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  // void _onIntroEnd(context) {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (_) => const HomePage()),
  //   );
  // }

  Widget _buildImage(String imagePath, [double width = 350]) {
    return Image.asset(
      imagePath,
    );
  }

  var bodyStyle = TextStyle(
      fontSize: 19.0, color: ColorsManager.gold, fontWeight: FontWeight.w500);

  late var pageDecoration = PageDecoration(
    imageAlignment: Alignment.center,
    //bodyAlignment: Alignment.bottomCenter,
    imageFlex: 4,
    titleTextStyle: TextStyle(
        color: ColorsManager.gold, fontSize: 21.0, fontWeight: FontWeight.w700),
    bodyTextStyle: bodyStyle,
    //bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: ColorsManager.black,
    imagePadding: EdgeInsets.only(top: 150, left: 16, right: 16),
  );

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: ColorsManager.black,

      allowImplicitScrolling: false,
      // scrollPhysics: NeverScrollableScrollPhysics(),

      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: SafeArea(
            bottom: true,
            child: Image.asset(
              AssetsManager.islamiLogo,
            ),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "",
          body: "Welcome To Islami App",
          image: _buildImage(AssetsManager.onboarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AssetsManager.onboarding3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AssetsManager.onboarding4),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage(AssetsManager.onboarding5),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage(AssetsManager.onboarding2),
          decoration: pageDecoration,
        ),
      ],

      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      skip: Text("Skip"),
      onSkip: () {},

      back: Text("Back",
          style: TextStyle(
              color: ColorsManager.gold, fontWeight: FontWeight.w600)),

      next: Text("Next",
          style: TextStyle(
              color: ColorsManager.gold, fontWeight: FontWeight.w600)),

      done: const Text('Done',
          style: TextStyle(
              color: ColorsManager.gold, fontWeight: FontWeight.w600)),
      onDone: () {
        Navigator.pushReplacementNamed(context, RoutesManager.splash);
      },
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      // controlsPadding: kIsWeb
      //   ? const EdgeInsets.all(12.0)
      //   : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: ColorsManager.gold,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

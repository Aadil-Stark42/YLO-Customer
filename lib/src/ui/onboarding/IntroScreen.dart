import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../intro_slider/src/intro_slider_config.dart';
import '../../../intro_slider/src/intro_slider_widget.dart';
import '../../../intro_slider/src/slide.dart';
import '../../../res/ResColor.dart';
import '../../../res/ResString.dart';
import '../../../utils/LocalStorageName.dart';
import 'LoginScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> onDonePress() async {
    // Do what you want
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntroDone, true);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height / 1.4;
    slides.add(
      Slide(
          title: "Earn Local Loyalty Coin",
          description: "Earn loyalty coin from every purchase.",
          pathImage: "${imagepathstr}slider_1.png",
          backgroundColor: whiteColor,
          heightImage: height,
          foregroundImageFit: BoxFit.cover),
    );
    slides.add(
      Slide(
          title: "Know your Local Offers",
          description: "Find exciting offers from the shop near you.",
          pathImage: "${imagepathstr}slider_2.png",
          backgroundColor: whiteColor,
          heightImage: height,
          foregroundImageFit: BoxFit.cover),
    );
    slides.add(
      Slide(
          title: "Local Events & Stories",
          description:
              "Find about events happening locally and see stores around you.",
          pathImage: "${imagepathstr}slider_3.png",
          backgroundColor: whiteColor,
          heightImage: height,
          foregroundImageFit: BoxFit.cover),
    );

    return IntroSlider(
      slides: slides,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      onDonePress: onDonePress,
      onSkipPress: onDonePress,
    );
  }
}

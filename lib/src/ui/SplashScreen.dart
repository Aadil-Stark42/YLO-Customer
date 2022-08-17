import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylocustomer/src/ui/dashboard/DashboardScreen.dart';

import '../../res/ResColor.dart';
import '../../res/ResString.dart';
import '../../utils/LocalStorageName.dart';
import 'onboarding/IntroScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    print("checkFirstSeen");

    Future.delayed(const Duration(milliseconds: 2000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(isLogin) == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const IntroScreen()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              '${imagepathstr}splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          AnimationLimiter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 2000),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 250.0,
                  child: SlideAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  Center(
                    child: Image.asset(
                      '${imagepathstr}splash_logo.png',
                      width: double.maxFinite,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

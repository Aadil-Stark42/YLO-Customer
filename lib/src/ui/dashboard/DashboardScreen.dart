import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../component/rounded_input_field.dart';
import '../../../res/ResColor.dart';
import '../../../res/ResString.dart';
import '../../../intro_slider/src/intro_slider_config.dart';
import '../../../intro_slider/src/intro_slider_widget.dart';
import '../../../intro_slider/src/slide.dart';
import '../../../utils/LocalStorageName.dart';
import '../../../utils/Utils.dart';
import '../../models/CountryCodee.dart';
import '../../resources/repository.dart';
import 'HomeScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<Widget> viewContainer = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: whiteColor,
        body: viewContainer[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 55,
          height: 55,
          child: const CircleAvatar(
            backgroundColor: blueColor,
            child: Center(
              child: Icon(
                Icons.qr_code_scanner,
                color: unSelectedNavigationColor,
                size: 25,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomNavigationBar(
                backgroundColor: mainColor,
                selectedItemColor: mainColor,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: greyColor3,
                selectedFontSize: 11,
                unselectedFontSize: 12,
                onTap: onTabTapped,
                // new
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: Icon(
                        Icons.home_filled,
                        size: 22,
                        color: currentIndex == 0
                            ? whiteColor
                            : unSelectedNavigationColor,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: Image.asset(
                        "${imagepathstr}ic_reffrel.png",
                        width: 22,
                        height: 22,
                        color: currentIndex == 1
                            ? whiteColor
                            : unSelectedNavigationColor,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: Icon(
                        Icons.favorite,
                        size: 22,
                        color: currentIndex == 2
                            ? whiteColor
                            : unSelectedNavigationColor,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 3, top: 3),
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        size: 22,
                        color: currentIndex == 3
                            ? whiteColor
                            : unSelectedNavigationColor,
                      ),
                    ),
                    label: "",
                  ),
                ]),
          ),
        ));
  }

  void onTabTapped(int index) {
    setState(() {});
  }
}

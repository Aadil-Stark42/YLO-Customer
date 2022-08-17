import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylocustomer/src/blocs/DashBoardBloc.dart';

import '../../../res/ResColor.dart';
import '../../../res/ResString.dart';
import '../../../utils/LocalStorageName.dart';
import '../../../utils/Utils.dart';
import '../../models/DashBoardDataModel.dart';
import '../../models/UserDataModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  SharedPreferences? prefs;
  late List<Widget> imageSliders = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: whiteColor,
        body: CustomScrollView(
          slivers: [
            Container(
              child: SliverAppBar(
                pinned: false,
                expandedHeight: 70.0,
                backgroundColor: whiteColor,
                floating: true,
                shadowColor: greyColor2,
                snap: false,
                flexibleSpace: const FlexibleSpaceBar(),
                elevation: 2,
                forceElevated: false,
                centerTitle: false,
                automaticallyImplyLeading: false,
                leading: null,
                title: Container(
                  margin: const EdgeInsets.only(top: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      const Icon(
                        Icons.dashboard,
                        size: 25,
                        color: mainColor,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset(
                        "${imagepathstr}ic_ylo.png",
                        height: 30,
                        width: 120,
                      ),
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    '${imagepathstr}ic_ylocoin.png',
                                    width: 40,
                                    height: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "15000",
                                    style: TextStyle(
                                        color: coinColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: poppinsmedium),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.notifications,
                            color: mainColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "${imagepathstr}account_place_holder.png",
                            width: 35,
                            height: 35,
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              StreamBuilder(
                stream: blocDashboard.allDashBoard,
                builder: (context, AsyncSnapshot<DashBoardDataModel> snapshot) {
                  if (snapshot.hasData) {
                    return mainView(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: size.height / 2.4,
                      ),
                      loadingColor(mainColor, 25.0, 25.0)
                    ],
                  );
                },
              ),
            ]))
          ],
        ));
  }

  Future<void> getUserData() async {
    prefs = await SharedPreferences.getInstance();
    currentUserData = UserDataModel.fromJson(
        json.decode(prefs!.getString(loginUser).toString()));
    getDashboard();
  }

  Widget mainView(DashBoardDataModel? data) {
    return Column(
      children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) => FadeInAnimation(
                child: SlideAnimation(
                  child: widget,
                ),
              ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.my_location,
                        size: 14,
                        color: mainColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                          prefs!.getString(currentCountry).toString() == "India"
                              ? "${imagepathstr}indiaflag.png"
                              : "${imagepathstr}canadaflag.png",
                          width: 16,
                          height: 16),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${prefs!.getString(currentPlace)}, ${prefs!.getString(currentCountry)}",
                        style: TextStyle(
                            fontFamily: poppinsregular,
                            fontSize: 13,
                            color: greyColor4),
                      )
                    ],
                  )),
                  Container(
                    width: 1.5,
                    height: 15,
                    color: greyColor5,
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        goodMorning,
                        style: TextStyle(
                            fontFamily: poppinsregular,
                            fontSize: 13,
                            color: blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          "${imagepathstr}ic_sun.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: greyColor5, width: 0.7),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Text(
                    searchYourLocal,
                    style: TextStyle(
                        fontFamily: poppinsregular,
                        fontSize: 13,
                        color: greyColor4),
                  ),
                  const Spacer(),
                  Image.asset(
                    "${imagepathstr}ic_search.png",
                    width: 32,
                    height: 32,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            imageSliderView(data!),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    categories,
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontFamily: poppinsmedium),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: blackColor,
                    size: 25,
                  ),
                  const Spacer(),
                  Text(
                    seeAll,
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontFamily: poppinsmedium),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            categorieView(data),
            const SizedBox(
              height: 10,
            ),
            premuimOfferView(data),
            const SizedBox(
              height: 10,
            ),
            localYloShopView(data),
          ]),
    );
  }

  Widget imageSliderView(DashBoardDataModel data) {
    if (imageSliders.isEmpty) {
      imageSliders.clear();
      for (var element in data.homePageData!.banners![0].bannersData!) {
        imageSliders.add(imageSlideView(element.bannerImage.toString()));
      }
    }
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 9,
              initialPage: currentIndex,
              viewportFraction: 1,
              disableCenter: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Positioned(
          bottom: 20,
          left: size.width / 4,
          child: CarouselIndicator(
            activeColor: mainColor,
            color: greyColor5,
            count: imageSliders.length,
            index: currentIndex,
          ),
        )
      ],
    );
  }

  Widget imageSlideView(String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Image.asset("${iconpath}ic_launcher.png"),
          imageUrl: path,
        ),
      ),
    );
  }

  Widget categorieView(DashBoardDataModel data) {
    if (data.homePageData!.categories![0].categoriesData![0].scName !=
        "Near Me") {
      data.homePageData!.categories![0].categoriesData!.insert(
          0,
          CategoriesData(
              scId: 18,
              scName: "Near Me",
              scImage:
                  "https://ylo.app/stag/uploads/category/near_me_1574420473.png",
              scCountry: 2));
    }

    return SizedBox(
      height: 70,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          CategoriesData datas =
              data.homePageData!.categories![0].categoriesData![index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            mainColor,
                            mainLightColor,
                          ],
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Image.asset("${iconpath}ic_launcher.png"),
                          imageUrl: datas.scImage.toString(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          datas.scName.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: poppinsmedium,
                              fontSize: 11,
                              color: whiteColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  void getDashboard() {
    if (prefs != null) {
      blocDashboard.fetchAllDashboard(
          prefs!.getString(currentPlace),
          prefs!.getString(latitude),
          prefs!.getString(longitude),
          prefs!.getString(currentCountry),
          context);
    }
  }

  premuimOfferView(DashBoardDataModel data) {
    if (data.homePageData!.premiumOffers![0].premiumOffersData != null) {
      return Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  premuimOffer,
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 16,
                      fontFamily: poppinsmedium),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: blackColor,
                  size: 25,
                ),
                const Spacer(),
                Text(
                  seeAll,
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontFamily: poppinsmedium),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 170,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: data
                  .homePageData!.premiumOffers![0].premiumOffersData!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                PremiumOffersData datas = data
                    .homePageData!.premiumOffers![0].premiumOffersData![index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                            width: 300,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 2,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            child: CachedNetworkImage(
                                              width: 120,
                                              height: 170,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                      "${iconpath}ic_launcher.png"),
                                              imageUrl:
                                                  datas.offerImage.toString(),
                                            ),
                                          ),
                                          Positioned(
                                              child: Container(
                                            decoration: const BoxDecoration(
                                                color: seffronColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                )),
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 2,
                                                bottom: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "${imagepathstr}ic_like.png",
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  datas.recommendedCount
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: poppinsmedium,
                                                      fontSize: 13,
                                                      color: whiteColor),
                                                )
                                              ],
                                            ),
                                          )),
                                          Positioned(
                                              bottom: 10,
                                              right: 3,
                                              child: yloPointView(
                                                  datas.coins.toString()))
                                        ],
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7, top: 7),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  datas.offerName
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color: blackColor,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          segoe_ui_bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  width: 120,
                                                  child: Text(
                                                    datas.shopName
                                                        .toString()
                                                        .toUpperCase(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        color: greyColor3,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            poppinsregular),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: greyColor3,
                                                      size: 11,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 5),
                                                        child: Text(
                                                          datas.shortAddress
                                                              .toString()
                                                              .toUpperCase(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: greyColor3,
                                                              fontSize: 11,
                                                              fontFamily:
                                                                  poppinsregular),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "${datas.distance} Away",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color: greyColor3,
                                                      fontSize: 10,
                                                      fontFamily:
                                                          poppinsregular),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    datas.offerActualValue
                                                            .toString()
                                                            .isNotEmpty
                                                        ? Text(
                                                            "${prefs!.getString(cuurentCurrancySign)!} ${datas.offerActualValue.toString().toString().toUpperCase()}",
                                                            style: TextStyle(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    gothambold,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          )
                                                        : const SizedBox(
                                                            width: 0,
                                                            height: 0,
                                                          ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      "${prefs!.getString(cuurentCurrancySign)!} ${datas.offerValue.toString().toString().toUpperCase()}",
                                                      style: TextStyle(
                                                          color: blackColor,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              gothambold),
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 65,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          color: seffronColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  seffronColor2)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              seffronColor2)),
                                                              child: const Icon(
                                                                Icons
                                                                    .remove_rounded,
                                                                color:
                                                                    seffronColor2,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            datas.buyqty
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    poppinsmedium,
                                                                color:
                                                                    whiteColor),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              seffronColor2)),
                                                              child: const Icon(
                                                                Icons
                                                                    .add_rounded,
                                                                color:
                                                                    seffronColor2,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  seffronColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                              )),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 22,
                                                              right: 22,
                                                              top: 4,
                                                              bottom: 5),
                                                      child: Text(
                                                        buy,
                                                        style: TextStyle(
                                                            color: whiteColor,
                                                            fontSize: 13,
                                                            fontFamily:
                                                                poppinsregular),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 2,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                      "${imagepathstr}ic_offer_badge.png",
                                    ))),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8,
                                            left: 10,
                                            right: 8),
                                        child: Text(
                                          datas.discountPercentage.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: gothambold,
                                              fontSize: 9,
                                              height: 1.0,
                                              color: whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ))),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      const SizedBox();
    }
  }

  localYloShopView(DashBoardDataModel data) {
    if (data.homePageData!.shops != null) {
      return Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  premuimOffer,
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 16,
                      fontFamily: poppinsmedium),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: blackColor,
                  size: 25,
                ),
                const Spacer(),
                Text(
                  seeAll,
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontFamily: poppinsmedium),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 170,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: data
                  .homePageData!.premiumOffers![0].premiumOffersData!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                PremiumOffersData datas = data
                    .homePageData!.premiumOffers![0].premiumOffersData![index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                            width: 300,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 2,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                            child: CachedNetworkImage(
                                              width: 120,
                                              height: 170,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                      "${iconpath}ic_launcher.png"),
                                              imageUrl:
                                                  datas.offerImage.toString(),
                                            ),
                                          ),
                                          Positioned(
                                              child: Container(
                                            decoration: const BoxDecoration(
                                                color: seffronColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                )),
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 2,
                                                bottom: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "${imagepathstr}ic_like.png",
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  datas.recommendedCount
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: poppinsmedium,
                                                      fontSize: 13,
                                                      color: whiteColor),
                                                )
                                              ],
                                            ),
                                          )),
                                          Positioned(
                                              bottom: 10,
                                              right: 3,
                                              child: yloPointView(
                                                  datas.coins.toString()))
                                        ],
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7, top: 7),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  datas.offerName
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color: blackColor,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          segoe_ui_bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  width: 120,
                                                  child: Text(
                                                    datas.shopName
                                                        .toString()
                                                        .toUpperCase(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        color: greyColor3,
                                                        fontSize: 13,
                                                        fontFamily:
                                                            poppinsregular),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: greyColor3,
                                                      size: 11,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(right: 5),
                                                        child: Text(
                                                          datas.shortAddress
                                                              .toString()
                                                              .toUpperCase(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              color: greyColor3,
                                                              fontSize: 11,
                                                              fontFamily:
                                                                  poppinsregular),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "${datas.distance} Away",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color: greyColor3,
                                                      fontSize: 10,
                                                      fontFamily:
                                                          poppinsregular),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    datas.offerActualValue
                                                            .toString()
                                                            .isNotEmpty
                                                        ? Text(
                                                            "${prefs!.getString(cuurentCurrancySign)!} ${datas.offerActualValue.toString().toString().toUpperCase()}",
                                                            style: TextStyle(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    gothambold,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough),
                                                          )
                                                        : const SizedBox(
                                                            width: 0,
                                                            height: 0,
                                                          ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      "${prefs!.getString(cuurentCurrancySign)!} ${datas.offerValue.toString().toString().toUpperCase()}",
                                                      style: TextStyle(
                                                          color: blackColor,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              gothambold),
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 65,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          color: seffronColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  seffronColor2)),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              seffronColor2)),
                                                              child: const Icon(
                                                                Icons
                                                                    .remove_rounded,
                                                                color:
                                                                    seffronColor2,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            datas.buyqty
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                fontFamily:
                                                                    poppinsmedium,
                                                                color:
                                                                    whiteColor),
                                                          ),
                                                          Spacer(),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              seffronColor2)),
                                                              child: const Icon(
                                                                Icons
                                                                    .add_rounded,
                                                                color:
                                                                    seffronColor2,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  seffronColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                              )),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 22,
                                                              right: 22,
                                                              top: 4,
                                                              bottom: 5),
                                                      child: Text(
                                                        buy,
                                                        style: TextStyle(
                                                            color: whiteColor,
                                                            fontSize: 13,
                                                            fontFamily:
                                                                poppinsregular),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 2,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                      "${imagepathstr}ic_offer_badge.png",
                                    ))),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8,
                                            left: 10,
                                            right: 8),
                                        child: Text(
                                          datas.discountPercentage.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: gothambold,
                                              fontSize: 9,
                                              height: 1.0,
                                              color: whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ))),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      const SizedBox();
    }
  }

  Widget yloPointView(coins) {
    return Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 4),
        child: Column(
          children: [
            Text(
              earn,
              style: TextStyle(
                  fontFamily: poppinsmedium, fontSize: 10, color: blackColor),
            ),
            Row(
              children: [
                Image.asset(
                  '${imagepathstr}ic_ylocoin.png',
                  width: 25,
                  height: 9,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  coins,
                  style: TextStyle(
                      color: coinColor,
                      fontSize: 8,
                      fontFamily: poppinsregular),
                ),
              ],
            )
          ],
        ));
  }
}

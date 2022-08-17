import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../otpview/otp_field.dart';
import '../../../otpview/style.dart';
import '../../../res/ResColor.dart';
import '../../../res/ResString.dart';
import '../../../utils/LocalStorageName.dart';
import '../../../utils/Utils.dart';
import '../../resources/repository.dart';

class OtpScreen extends StatefulWidget {
  String mobile;
  String accountid;

  OtpScreen({required this.mobile, required this.accountid, Key? key})
      : super(key: key);

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  bool isLoading = false;
  String otpStr = "";

  @override
  void initState() {
    super.initState();
    isLocationPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
            children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 1000),
          childAnimationBuilder: (widget) => FadeInAnimation(
            child: SlideAnimation(
              child: widget,
            ),
          ),
          children: [
            Container(
              width: double.maxFinite,
              height: 430,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: const LinearGradient(colors: [
                    mainColor,
                    mainLightColor,
                  ])),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                          const Spacer(),
                          Text(
                            enterotp,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontFamily: poppinsregular),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      "${imagepathstr}mobilelock.png",
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    otpsended,
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontFamily: poppinsregular),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Mobile number :- ${widget.mobile}",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontFamily: poppinsregular),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 70,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onChanged: (currentvalue) {},
                    onCompleted: (pin) {
                      print("Completed: $pin");
                      otpStr = pin;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t received OTP ?",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 15,
                            fontFamily: poppinsmedium),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Resend OTP",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontFamily: poppinsmedium),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  !isLoading
                      ? InkWell(
                          onTap: () async {
                            print(otpStr);
                            if (otpStr.isEmpty) {
                              ShowToast(validOtp, context);
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              String? token =
                                  await FirebaseMessaging.instance.getToken();
                              checkPermission();
                              await Repository().otpVerify(
                                  widget.accountid, otpStr, token, context);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  mainColor,
                                  mainLightColor,
                                ])),
                            child: Center(
                              child: Text(
                                continuee,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 14,
                                    fontFamily: poppinsmedium),
                              ),
                            ),
                          ))
                      : CircularProgressIndicator(strokeWidth: 2),
                  /* AnimatedCrossFade(
                    firstChild:

                    secondChild:

                    crossFadeState: !isLoading
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 1),
                  )*/
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  void checkPermission() async {
    bool isgranted = await isLocationPermission(context);
    if (isgranted) {
      var position = await GeolocatorPlatform.instance.getCurrentPosition();
      print("position.latitude ${position.latitude}");
      print("position.latitude ${position.longitude}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(latitude, position.latitude.toString());
      prefs.setString(longitude, position.longitude.toString());
      GeoData data = await Geocoder2.getDataFromCoordinates(
          latitude: position.latitude,
          longitude: position.longitude,
          googleMapApiKey: mapApiKey);
      prefs.setString(currentCountry, data.country.toString());
      prefs.setString(currentPlace, data.city.toString());
      print("addresses.first.countryName ${data.country}");
      print("addresses.first.locality ${data.city}");
    }
  }
}

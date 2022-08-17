import 'dart:io';
import 'dart:math' as math;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}

void ShowToast(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(message),
  ));
}

void ShowLongToast(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(message),
  ));
}

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

void HideKeyBoard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

Future<bool> isLocationPermission(context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ShowToast("Location services are disabled kindly enable.", context);
    return false;
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ShowToast("Location permissions are denied.", context);
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    ShowToast(
        "Location permissions are permanently denied, we cannot request permissions.",
        context);
    return false;
  }
  return true;
}

Future<String?> GetDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // Unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // Unique ID on Android
  }
}

Widget loadingColor(Color loadingColor, height, width) {
  return SizedBox(
    width: width,
    height: height,
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: loadingColor,
    ),
  );
}

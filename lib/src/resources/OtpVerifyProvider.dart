import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/ApiService.dart';
import '../../apiservice/EndPoints.dart';
import '../../utils/LocalStorageName.dart';
import '../../utils/Utils.dart';
import '../ui/dashboard/DashboardScreen.dart';

class OtpVerifyProvider {
  Future<void> otpverify(accid, otp, fcmtoken, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var Params = <String, dynamic>{};
    Params[accountId] = accid;
    Params[pin] = otp;
    Params[fcmToken] = fcmtoken;
    print("otpverifyParams ${Params.toString()}");
    var ApiCalling = getApiInstance();
    Response response;
    response = await ApiCalling.post(otpVerify, data: Params);
    print("otpverifyResponse ${response.data.toString()}");
    ShowToast(response.data[message].toString(), context);
    if (response.data[status]) {
      prefs.setString(
          bToken, response.data["userLoginData"]["token"].toString());
      prefs.setString(loginUser, json.encode(response.data).toString());
      Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(builder: (context) => const DashboardScreen()));
    }
  }
}

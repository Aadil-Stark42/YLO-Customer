import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/ApiService.dart';
import '../../apiservice/EndPoints.dart';
import '../../utils/LocalStorageName.dart';
import '../../utils/Utils.dart';
import '../ui/onboarding/OtpScreen.dart';

class OtpProvider {
  Future<void> login(mobilenumber, countrycode, refercode, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var Params = <String, dynamic>{};
    Params[mobile] = mobilenumber;
    Params[mcc] = countrycode;
    Params[referralCode] = refercode;
    print("loginParams ${Params.toString()}");
    var ApiCalling = getApiInstance();
    Response response;
    response = await ApiCalling.post(loginApi, data: Params);
    print("loginApiCalling${response.data.toString()}");
    ShowToast(response.data[message].toString(), context);
    if (response.data[status]) {
      prefs.setString(loginCountry, countrycode == "+91" ? india : canada);
      prefs.setString(loginCountryCode, countrycode);
      prefs.setBool(isLogin, true);
      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => OtpScreen(
                mobile: mobilenumber,
                accountid: response.data[accountId].toString(),
              )));
    }
  }
}

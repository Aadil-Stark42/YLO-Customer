import 'dart:async';
import 'package:ylocustomer/src/resources/DashboardProvider.dart';
import 'package:ylocustomer/src/resources/OtpProvider.dart';

import '../models/DashBoardDataModel.dart';
import 'OtpVerifyProvider.dart';

class Repository {
  final otpProvider = OtpProvider();

  Future<void> loginapi(mobilenumber, countrycode, refercode, context) =>
      otpProvider.login(mobilenumber, countrycode, refercode, context);

/*--------*/
  final otpVerifyProvider = OtpVerifyProvider();

  Future<void> otpVerify(accid, otp, fcmtoken, context) =>
      otpVerifyProvider.otpverify(accid, otp, fcmtoken, context);

/*--------*/
  final dashboardProvider = DashboardProvider();

  Future<DashBoardDataModel> dashboard(
          city_, latitude_, longitude_, country_, context) =>
      dashboardProvider.dashboard(
          city_, latitude_, longitude_, country_, context);
}

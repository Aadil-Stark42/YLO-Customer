import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylocustomer/src/models/UserDataModel.dart';

import '../../apiservice/ApiService.dart';
import '../../apiservice/EndPoints.dart';
import '../../utils/LocalStorageName.dart';
import '../../utils/Utils.dart';
import '../models/DashBoardDataModel.dart';

class DashboardProvider {
  Future<DashBoardDataModel> dashboard(
      city_, latitude_, longitude_, country_, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDataModel user = UserDataModel.fromJson(
        json.decode(prefs.getString(loginUser).toString()));
    var params = <String, dynamic>{};
    params[city] = city_;
    params[accountId] = user.userLoginData!.user!.accountId;
    params[latitude] = latitude_;
    params[longitude] = latitude_;
    params[country] = country_;
    print("dashboardarams ${params.toString()}");

    var apiCalling =
        getApiInstanceWithHeaders(user.userLoginData!.token.toString());
    Response response;
    response = await apiCalling.post(
      customerDashboard,
      data: params,
    );
    print("dashboardResponse${response.data.toString()}");
    if (response.data[status]) {
      prefs.setString(
          cuurentCurrancySign,
          DashBoardDataModel.fromJson(response.data)
              .homePageData!
              .currencySign
              .toString());
      return DashBoardDataModel.fromJson(response.data);
    } else {
      ShowToast(response.data[message].toString(), context);
      return DashBoardDataModel();
    }
  }
}

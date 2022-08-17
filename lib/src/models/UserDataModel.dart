class UserDataModel {
  bool? status;
  String? message;
  UserLoginData? userLoginData;

  UserDataModel({this.status, this.message, this.userLoginData});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userLoginData = json['userLoginData'] != null
        ? UserLoginData.fromJson(json['userLoginData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userLoginData != null) {
      data['userLoginData'] = userLoginData!.toJson();
    }
    return data;
  }
}

class UserLoginData {
  User? user;
  String? token;

  UserLoginData({this.user, this.token});

  UserLoginData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? accountId;
  String? accountName;
  int? accountRoleId;
  String? accountUsercode;
  String? accountMobileNo;
  Null? accountEmail;
  String? accountImage;
  int? accountIsActive;

  User(
      {this.accountId,
      this.accountName,
      this.accountRoleId,
      this.accountUsercode,
      this.accountMobileNo,
      this.accountEmail,
      this.accountImage,
      this.accountIsActive});

  User.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    accountName = json['account_name'];
    accountRoleId = json['account_role_id'];
    accountUsercode = json['account_usercode'];
    accountMobileNo = json['account_mobile_no'];
    accountEmail = json['account_email'];
    accountImage = json['account_image'];
    accountIsActive = json['account_is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['account_name'] = accountName;
    data['account_role_id'] = accountRoleId;
    data['account_usercode'] = accountUsercode;
    data['account_mobile_no'] = accountMobileNo;
    data['account_email'] = accountEmail;
    data['account_image'] = accountImage;
    data['account_is_active'] = accountIsActive;
    return data;
  }
}

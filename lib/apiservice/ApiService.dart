/*
import 'dart:convert';

import 'package:http/http.dart' as http;

 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../src/models/UserDataModel.dart';
import '../utils/LocalStorageName.dart';
import 'EndPoints.dart';

Dio getApiInstance() {
  var dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.contentType = Headers.formUrlEncodedContentType;
  return dio;
}

Dio getApiInstanceWithHeaders(token) {
  var header = <String, dynamic>{};
  header[Authorization] = Bearer + token.toString();
  var dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.headers = header;
  return dio;
}

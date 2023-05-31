import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/utils.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  //get Api
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print("url---$url");
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  //post api---
  @override
  Future postApi(String url, var data) async {
    if (kDebugMode) {
      print("url---$url");
      print("body---$data");
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw InvalidUrlException;

      default:
        throw FetchDataException(
            "Error occurred while fetching data from server: " +
                response.statusCode.toString());
    }
  }
}

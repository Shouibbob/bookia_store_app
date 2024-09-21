import 'dart:convert';
import 'dart:developer';

import 'package:bookia_store_app/core/constants/constants.dart';
import 'package:bookia_store_app/feature/auth/data/models/response/auth_response_model/auth_response_model.dart';
import 'package:bookia_store_app/feature/auth/data/models/request/login_params.dart';
import 'package:bookia_store_app/feature/auth/data/models/request/register_params.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  //Dio, Http ----> handle calls api (Dio More Papuler)
  static Future<AuthResponseModel?> register(RegisterParams params) async {
    // 1) parse baseUrl+endPoint from string to Uri {Not in Dio}
    // 2) call Api with specified Methods {get or post or put or delete}
    // 3) check status code {200 ok} or other Failures.
    // 4) convert response body from string to json {only in Http} {jsonDecode} {Not in Dio}
    // 5) if 200 => parse json response to model and return it.
    // 6) handle Failures

    try {
      var url =
          Uri.parse(AppConstants.baseUrl + AppConstants.registerEndpoints);
      var response = await http.post(url, body: params.toJson());
      log("200 $response");
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        var model = AuthResponseModel.fromJson(jsonResponse);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponseModel?> login(LoginParams params) async {
    try {
      var url = Uri.parse(AppConstants.baseUrl + AppConstants.loginEndpoints);
      var response = await http.post(url, body: params.toJson());
      log("200 $response");
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var model = AuthResponseModel.fromJson(jsonResponse);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

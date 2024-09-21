import 'dart:developer';

import 'package:bookia_store_app/core/constants/constants.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/feature/auth/data/models/response/auth_response_model/auth_response_model.dart';
import 'package:bookia_store_app/feature/auth/data/models/request/login_params.dart';
import 'package:bookia_store_app/feature/auth/data/models/request/register_params.dart';
import 'package:bookia_store_app/feature/auth/data/models/response/send_forget_password_response_model/send_forget_password_response_model.dart';

class AuthRepo {
  //Dio, Http ----> handle calls api (Dio More Papuler)
  static Future<AuthResponseModel?> register(RegisterParams params) async {
    // 1) call Api with specified Methods {get or post or put or delete}
    // 2) check status code {200 ok} or other Failures.
    // 3) if 200 => parse json response to model and return it.
    // 4) handle Failures

    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.registerEndpoints, data: params.toJson());
      if (response.statusCode == 201) {
        var model = AuthResponseModel.fromJson(response.data);
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
      var response = await DioProvider.post(
          endPoint: AppConstants.loginEndpoints, data: params.toJson());
      if (response.statusCode == 200) {
        var model = AuthResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SendForgetPasswordResponseModel?> sendForgetPassword(
      {required String? email}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.sendForgetPasswordEndpoints,
          data: {
            "email": email,
          });
      if (response.statusCode == 200) {
        var model = SendForgetPasswordResponseModel.fromJson(response.data);
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

import 'dart:developer';

import 'package:bookia_store_app/core/constants/constants.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/core/services/local_storage.dart';
import 'package:bookia_store_app/feature/profile/data/models/response/change_password_response_model/change_password_response_model.dart';
import 'package:bookia_store_app/feature/profile/data/models/response/profile_response_model/profile_response_model.dart';
import 'package:bookia_store_app/feature/profile/data/models/response/update_profile_response_model/update_profile_response_model.dart';

class ProfileRepo {
  static Future<ProfileResponseModel?> getProfileData() async {
    try {
      var respons = await DioProvider.get(
          endPoint: AppConstants.profileEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (respons.statusCode == 200) {
        log("${respons.statusCode}");
        var model = ProfileResponseModel.fromJson(respons.data);
        return model;
      } else {
        log('error');
        return null;
      }
    } catch (e) {
      log('wrong ${e.toString()}');
      return null;
    }
  }

  static Future<UpdateProfileResponseModel?> updateProfileData({
    required String? name,
    required String? email,
    required String? password,
    required String? confirmPassword,
  }) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.updateprofileEndpoints,
          data: {
            "name": name,
            "email": email,
            "password": password,
            "confirm_password": confirmPassword
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = UpdateProfileResponseModel.fromJson(response.data);
        return model;
      } else {
        log("error ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<ChangePasswordResponseModel?> changePassword(
      {required String? currentPassword,
      required String? newPassword,
      required String? newConfirmPassword}) async {
    try {
      var response = await DioProvider.post(
        endPoint: AppConstants.changePasswordEndpoints,
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
          "new_password_confirmation": newConfirmPassword,
        },
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
        },
      );
      if (response.statusCode == 200) {
        var model = ChangePasswordResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } catch (e) {
      log('error reset password ${e.toString()}');
      return null;
    }
  }

  // static Future<bool> logOut() async {
  //   try {
  //     var response = await DioProvider.post(
  //       endPoint: AppConstants.logOutEndpoints,
  //       headers: {
  //         "Authorization":
  //             "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return false;
  //   }
  // }
}

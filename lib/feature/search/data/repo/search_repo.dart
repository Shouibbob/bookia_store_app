import 'dart:developer';

import 'package:bookia_store_app/core/constants/constants.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';

class SearchRepo {
  static Future<BestSellerResponseModel?> productSearch(
      {required String searchName}) async {
    try {
      var response = await DioProvider.get(
        endPoint: AppConstants.searchEndpoints,
        query: {
          "name": searchName,
        },
      );
      if (response.statusCode == 200) {
        log('success ${response.statusCode}');
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      } else {
        log('error ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

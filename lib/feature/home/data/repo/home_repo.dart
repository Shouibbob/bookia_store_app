import 'dart:developer';

import 'package:bookia_store_app/core/constants/constants.dart';
import 'package:bookia_store_app/core/services/dio_provider.dart';
import 'package:bookia_store_app/core/services/local_storage.dart';
import 'package:bookia_store_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/governorates_response_model/governorates_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/update_cart_response_model/update_cart_response_model.dart';

class HomeRepo {
  //Dio, Http ----> handle calls api (Dio More Papuler)
  static Future<BestSellerResponseModel?> getBestSellerBooks() async {
    try {
      var response = await DioProvider.get(
        endPoint: AppConstants.bestSellerBooksEndpoints,
      );
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<HomeBannerResponseModel?> getHomeBanner() async {
    try {
      var response = await DioProvider.get(
        endPoint: AppConstants.homeBannerEndpoints,
      );
      if (response.statusCode == 200) {
        var model = HomeBannerResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addTowishlist({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.addToWishlistEndpoints,
          data: {
            "product_id": productId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromwishlist({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.removeFromWishlistEndpoints,
          data: {
            "product_id": productId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetWishlistResponseModel?> getWishlist() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.getWishlistEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = GetWishlistResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  //cart

  static Future<bool> addTocart({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.addToCartEndpoints,
          data: {
            "product_id": productId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromcart({required int cartId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.removeFromCartEndpoints,
          data: {
            "cart_item_id": cartId,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        log("else bloc ${response.statusCode}");
        return false;
      }
    } on Exception catch (e) {
      log('repo ${e.toString()}');
      return false;
    }
  }

  static Future<GetCartResponseModel?> getCart() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.getCartEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = GetCartResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<UpdateCartResponseModel?> updateCart(
      {required int cartId, required int quantity}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.updateCartEndpoints,
          data: {
            "cart_item_id": cartId,
            "quantity": quantity
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}"
          });
      if (response.statusCode == 201) {
        log('success ${response.statusCode}');
        var model = UpdateCartResponseModel.fromJson(response.data);
        return model;
      } else {
        log('error ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('catch ${e.toString()}');
      return null;
    }
  }

  static Future<bool> checkout() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.checkoutEndpoints,
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 200) {
        log('success ${response.statusCode}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('catch ${e.toString()}');
      return false;
    }
  }

  static Future<bool> submitOrder(
      {required String name,
      required String governorateId,
      required String phone,
      required String address,
      required String email}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.placeOrderEndpoints,
          data: {
            "name": name,
            "governorate_id": governorateId,
            "phone": phone,
            "address": address,
            "email": email,
          },
          headers: {
            "Authorization":
                "Bearer ${AppLocalStorage.getData(key: AppLocalStorage.token)}",
          });
      if (response.statusCode == 200) {
        log('success ${response.statusCode}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('catch ${e.toString()}');
      return false;
    }
  }

  static Future<GovernoratesResponseModel?> getGovernorates() async {
    try {
      var response = await DioProvider.get(
        endPoint: AppConstants.governoratesEndpoints,
      );
      if (response.statusCode == 200) {
        log('success ${response.statusCode}');
        var model = GovernoratesResponseModel.fromJson(response.data);
        return model;
      } else {
        log('error ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('error repo catch ${e.toString()}');
      return null;
    }
  }
}

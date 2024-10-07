import 'dart:developer';

import 'package:bookia_store_app/feature/home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/governorates_response_model/governorates_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/home_banner_response_model/home_banner_response_model.dart';
import 'package:bookia_store_app/feature/home/data/models/response/update_cart_response_model/update_cart_response_model.dart';
import 'package:bookia_store_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestellerEvent>(getBestSellerBox);
    on<GetHomeBannerEvent>(getHomeBanner);
    on<AddToWishlistEvent>(addToWishlist);
    on<RemoveFromWishlistEvent>(removeFromWishlist);
    on<GetWishlistEvent>(getwishlist);
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
    on<GetCartEvent>(getCart);
    on<UpdateCartEvent>(updateCart);
    on<CheckoutEvent>(checkout);
    on<SubmitOrderEvent>(submitOrder);
    on<GovernoratesEvent>(getGovernorates);
  }

  BestSellerResponseModel? bestSellerResponseModel;
  HomeBannerResponseModel? homeBannerResponseModel;
  GetWishlistResponseModel? getWishlistResponseModel;
  GetCartResponseModel? getCartResponseModel;
  UpdateCartResponseModel? updateCartResponseModel;
  GovernoratesResponseModel? governoratesResponseModel;

  Future<void> getBestSellerBox(
      GetBestellerEvent event, Emitter<HomeState> emit) async {
    emit(BestSellerLoadingState());

    try {
      await HomeRepo.getBestSellerBooks().then((value) {
        if (value != null) {
          bestSellerResponseModel = value;
          emit(BestSellerLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> getHomeBanner(
      GetHomeBannerEvent event, Emitter<HomeState> emit) async {
    emit(HomeBannerLoadingState());

    try {
      await HomeRepo.getHomeBanner().then((value) {
        if (value != null) {
          homeBannerResponseModel = value;
          emit(HomeBannerLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> addToWishlist(
      AddToWishlistEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishlistLoadingState());

    try {
      await HomeRepo.addTowishlist(productId: event.productId).then((value) {
        if (value) {
          emit(AddToWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> removeFromWishlist(
      RemoveFromWishlistEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromWishlistLoadingState());

    try {
      await HomeRepo.removeFromwishlist(productId: event.productId)
          .then((value) {
        if (value) {
          emit(RemoveFromWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> getwishlist(
      GetWishlistEvent event, Emitter<HomeState> emit) async {
    emit(GetWishlistLoadingState());

    try {
      await HomeRepo.getWishlist().then((value) {
        if (value != null) {
          getWishlistResponseModel = value;
          emit(GetWishlistLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartLoadingState());

    try {
      await HomeRepo.addTocart(productId: event.productId).then((value) {
        if (value) {
          emit(AddToCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> removeFromCart(
      RemoveFromCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromCartLoadingState());

    try {
      await HomeRepo.removeFromcart(cartId: event.cartItemId).then((value) {
        if (value) {
          emit(RemoveFromCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartLoadingState());

    try {
      await HomeRepo.getCart().then((value) {
        if (value != null) {
          getCartResponseModel = value;
          emit(GetCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> updateCart(
      UpdateCartEvent event, Emitter<HomeState> emit) async {
    emit(UpdateCartLoadingState());
    try {
      await HomeRepo.updateCart(
              cartId: event.cartItemId, quantity: event.quantity)
          .then((value) {
        if (value != null) {
          updateCartResponseModel = value;
          emit(UpdateCartLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> checkout(CheckoutEvent event, Emitter<HomeState> emit) async {
    emit(CheckoutLoadingState());

    try {
      await HomeRepo.checkout().then((value) {
        if (value) {
          emit(CheckoutLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState());
    }
  }

  Future<void> submitOrder(
      SubmitOrderEvent event, Emitter<HomeState> emit) async {
    emit(SubmitOrderLoadingState());
    try {
      await HomeRepo.submitOrder(
        name: event.name,
        governorateId: event.governorateId,
        phone: event.phone,
        address: event.address,
        email: event.email,
      ).then((value) {
        if (value) {
          emit(SubmitOrderLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } catch (e) {
      log("error ${e.toString()}");
      emit(HomeErrorState());
    }
  }

  Future<void> getGovernorates(
      GovernoratesEvent event, Emitter<HomeState> emit) async {
    emit(GovernoratesLoadingState());
    try {
      await HomeRepo.getGovernorates().then((value) {
        if (value != null) {
          governoratesResponseModel = value;
          emit(GovernoratesLoadedState());
        } else {
          emit(HomeErrorState());
        }
      });
    } catch (e) {
      log('error bloc catch ${e.toString()}');
      emit(HomeErrorState());
    }
  }
}

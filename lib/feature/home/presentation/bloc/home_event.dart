part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetHomeBannerEvent extends HomeEvent {}

class GetBestellerEvent extends HomeEvent {}

class GetWishlistEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {
  final int productId;

  AddToWishlistEvent({required this.productId});
}

class RemoveFromWishlistEvent extends HomeEvent {
  final int productId;

  RemoveFromWishlistEvent({required this.productId});
}

// cart

class GetCartEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCartEvent extends HomeEvent {
  final int cartItemId;

  RemoveFromCartEvent({required this.cartItemId});
}

class UpdateCartEvent extends HomeEvent {
  final int cartItemId;
  final int quantity;

  UpdateCartEvent({required this.cartItemId, required this.quantity});
}

class CheckoutEvent extends HomeEvent {}

class SubmitOrderEvent extends HomeEvent {
  final String name;
  final String governorateId;
  final String phone;
  final String address;
  final String email;

  SubmitOrderEvent(
      {required this.name,
      required this.governorateId,
      required this.phone,
      required this.address,
      required this.email});
}

class GovernoratesEvent extends HomeEvent {}

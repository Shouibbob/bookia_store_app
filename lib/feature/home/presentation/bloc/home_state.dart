part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

// Banner
class HomeBannerLoadingState extends HomeState {}

class HomeBannerLoadedState extends HomeState {}

// best seller
class BestSellerLoadingState extends HomeState {}

class BestSellerLoadedState extends HomeState {}

// wishlist
class GetWishlistLoadingState extends HomeState {}

class GetWishlistLoadedState extends HomeState {}

class AddToWishlistLoadedState extends HomeState {}

class AddToWishlistLoadingState extends HomeState {}

class RemoveFromWishlistLoadedState extends HomeState {}

class RemoveFromWishlistLoadingState extends HomeState {}

// cart

class GetCartLoadingState extends HomeState {}

class GetCartLoadedState extends HomeState {}

class AddToCartLoadedState extends HomeState {}

class AddToCartLoadingState extends HomeState {}

class RemoveFromCartLoadedState extends HomeState {}

class RemoveFromCartLoadingState extends HomeState {}

class UpdateCartLoadedState extends HomeState {}

class UpdateCartLoadingState extends HomeState {}

// checkout

class CheckoutLoadedState extends HomeState {}

class CheckoutLoadingState extends HomeState {}

class SubmitOrderLoadedState extends HomeState {}

class SubmitOrderLoadingState extends HomeState {}

class GovernoratesLoadedState extends HomeState {}

class GovernoratesLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

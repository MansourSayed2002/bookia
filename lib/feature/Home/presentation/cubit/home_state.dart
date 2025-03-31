part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeError extends HomeState {
  HomeError(this.message);
  final String message;
}

final class AddToWishListOrCartLoading extends HomeState {}

final class AddToWishListOrCartSuccess extends HomeState {
  AddToWishListOrCartSuccess(this.message);
  final String message;
}

final class AddToWishListOrCartError extends HomeState {
  AddToWishListOrCartError(this.message);
  final String message;
}

final class HomeSearchLoading extends HomeState {}

final class HomeSearchSuccess extends HomeState {}

final class HomeSearchError extends HomeState {
  HomeSearchError(this.message);
  final String message;
}

part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartError extends CartState {
  CartError({required this.message});
  final String message;
}

final class CheckOutLoading extends CartState {}

final class CheckOutSuccess extends CartState {}

final class CheckOutError extends CartState {
  CheckOutError({required this.message});
  final String message;
}

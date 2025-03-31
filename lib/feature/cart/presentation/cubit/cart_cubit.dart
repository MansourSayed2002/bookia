import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/feature/cart/data/model/cart_model/cart_model.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartModel? cartModel;
  Future<void> getCart() async {
    emit(CartLoading());
    try {
      await CartRepo.getCart().then((value) {
        if (value is CartModel) {
          cartModel = value;
          emit(CartSuccess());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(CartError(message: "Something went wrong"));
    }
  }

  Future<void> deleteCart(cartItemId) async {
    emit(CartLoading());
    try {
      await CartRepo.removeCart(cartItemId).then((value) {
        if (value is CartModel) {
          cartModel = value;
          emit(CartSuccess());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(CartError(message: "Something went wrong"));
    }
  }

  Future<void> updateCart(cartItemId, quantity) async {
    emit(CartLoading());
    try {
      await CartRepo.updateCart(cartItemId, quantity).then((value) {
        if (value is CartModel) {
          cartModel = value;
          emit(CartSuccess());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(CartError(message: "Something went wrong"));
    }
  }
}

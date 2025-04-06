import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/cart/data/model/cart_model/cart_model.dart';
import 'package:bookia/feature/cart/data/model/check_out_user_model/check_out_user_model.dart';
import 'package:bookia/feature/cart/data/model/governorates_model/governorates_model.dart';
import 'package:bookia/feature/cart/data/model/request/confime_order_model.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartModel? cartModel;
  CheckOutUserModel? checkOutUserModel;
  GovernoratesModel? governoratesModel;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController governorate = TextEditingController();
  init(CheckOutUserModel checkOutUserModel) {
    name.text = checkOutUserModel.data!.user!.userName!;
    phone.text = checkOutUserModel.data!.user!.phone!;
    address.text = checkOutUserModel.data!.user!.address!;
    email.text = checkOutUserModel.data!.user!.userEmail!;
    getGovernorate();
  }

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

  Future<void> checkOutOrder() async {
    emit(CheckOutLoading());
    await CartRepo.checkOut().then((value) {
      if (value is CheckOutUserModel) {
        checkOutUserModel = value;
        emit(CheckOutSuccess());
      } else {
        emit(CheckOutError(message: "Something went wrong"));
      }
    });
  }

  Future<void> confirmeOrder() async {
    emit(CheckOutLoading());
    await CartRepo.confirmeOrder(
      ConfimeOrderModel(
        governorateId: governorate.text,
        name: name.text,
        phone: phone.text,
        address: address.text,
        email: email.text,
      ),
    ).then((value) {
      if (value == StatusRequest.success) {
        emit(CheckOutSuccess());
      } else {
        emit(CheckOutError(message: "Something went wrong"));
      }
    });
  }

  getGovernorate() async {
    emit(CartLoading());
    await CartRepo.getGovernorates().then((value) {
      if (value is GovernoratesModel) {
        governoratesModel = value;
        emit(CartSuccess());
      } else {
        emit(CartError(message: "Something went wrong"));
      }
    });
  }
}

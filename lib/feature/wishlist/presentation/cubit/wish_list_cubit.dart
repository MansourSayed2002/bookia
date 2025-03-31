import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/Home/data/model/response/product/product.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/wishlist/data/repo/wishList_repo.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  List<Product> products = [];
  Future<void> getWishList() async {
    try {
      await WishlistRepo.getWishList().then((value) {
        if (value.isNotEmpty) {
          List data = value['data']['data'];
          products.addAll(data.map((e) => Product.fromJson(e)));
          emit(WishListSuccess());
        }
      });
    } catch (e) {
      log(e.toString());
      emit(WishListError("Soemthing went wrong"));
    }
  }

  Future<void> removefromWishList(String idProduct) async {
    emit(WishListLoading());
    try {
      await WishlistRepo.removeWishList(idProduct).then((value) {
        if (value.isNotEmpty) {
          products.clear();
          List data = value['data']['data'];
          products.addAll(data.map((e) => Product.fromJson(e)));
          emit(WishListSuccess());
        }
      });
    } catch (e) {
      log(e.toString());
      emit(WishListError("Soemthing went wrong"));
    }
  }

  Future<void> addToCart(String productId) async {
    emit(WishListLoading());
    try {
      await CartRepo.addCart(productId).then((value) {
        if (value == StatusRequest.success) {
          emit(WishListSuccess());
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(WishListError("Something went wrong"));
    }
  }
}

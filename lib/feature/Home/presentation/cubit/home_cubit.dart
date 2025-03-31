import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';

import 'package:bookia/feature/Home/data/model/response/best_seller_model/best_seller_model.dart';
import 'package:bookia/feature/Home/data/model/response/search_product_model/search_product_model.dart';
import 'package:bookia/feature/Home/data/model/response/sliders_model/sliders_model.dart';
import 'package:bookia/feature/Home/data/repo/get_best_seller.dart';
import 'package:bookia/feature/Home/data/repo/get_sliders.dart';
import 'package:bookia/feature/Home/data/repo/search_repo.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:bookia/feature/wishlist/data/repo/wishList_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  SlidersModel? slidersModel;
  BestSellerModel? bestSellerModel;
  SearchProductModel? searchProductModel;
  int currentindex = 0;

  getAllData() async {
    emit(HomeLoading());
    try {
      Future.value([await getSliders(), await getBestSeller()]).then((value) {
        if (value.first && value.last == true) {
          emit(HomeSuccess());
        }
      });
    } catch (e) {
      emit(HomeError("Some thing is wrong"));
    }
  }

  Future<void> addToCart(String productId) async {
    emit(AddToWishListOrCartLoading());
    try {
      await CartRepo.addCart(productId).then((value) {
        if (value == StatusRequest.success) {
          emit(AddToWishListOrCartSuccess("Done Add Product To Cart"));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(AddToWishListOrCartError("Something went wrong"));
    }
  }

  Future<bool> getSliders() async {
    await GetSliders.getSliders().then((value) {
      if (value is SlidersModel) {
        slidersModel = value;
      }
    });
    return true;
  }

  Future<bool> getBestSeller() async {
    await GetBestSeller.getBestSeller().then((value) {
      if (value is BestSellerModel) {
        bestSellerModel = value;
      }
    });
    return true;
  }

  Future<void> addToWishList(idProduct) async {
    emit(AddToWishListOrCartLoading());
    try {
      await WishlistRepo.addWishList(idProduct).then((value) {
        emit(AddToWishListOrCartSuccess("Done Add Product To WishList"));
      });
    } catch (e) {
      log(e.toString());
      emit(AddToWishListOrCartError("Some thing is wrong"));
    }
  }

  searchData(name) async {
    emit(HomeSearchLoading());
    await SearchRepo.search(name).then((value) {
      if (value is SearchProductModel) {
        searchProductModel = value;
        emit(HomeSearchSuccess());
      } else {
        emit(HomeSearchError("Some thing is wrong"));
      }
    });
  }
}

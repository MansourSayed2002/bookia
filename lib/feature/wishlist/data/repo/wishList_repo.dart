import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';

class WishlistRepo {
  static getWishList() async {
    try {
      var response = await ApiConnect.getData(
        LinkApp.wishList,
        headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return StatusRequest.failure;
      }
    } on Exception catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static addWishList(String idProduct) async {
    var response = await ApiConnect.postData(
      LinkApp.addWishList,
      data: {"product_id": idProduct},
      headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
    );
    if (response.statusCode == 200) {
      return StatusRequest.success;
    } else {
      return StatusRequest.failure;
    }
  }

  static removeWishList(String idProduct) async {
    var response = await ApiConnect.postData(
      LinkApp.removeWishList,
      data: {"product_id": idProduct},
      headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
    );
    if (response.statusCode == 200) {
      print(LocalStorage.getData('token'));
      return response.data;
    } else {
      return StatusRequest.failure;
    }
  }
}

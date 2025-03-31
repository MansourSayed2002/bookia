import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/cart/data/model/cart_model/cart_model.dart';

class CartRepo {
  static getCart() async {
    var response = await ApiConnect.getData(
      LinkApp.cart,
      headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
    );
    if (response.statusCode == 200) {
      return CartModel.fromJson(response.data);
    } else {
      return StatusRequest.failure;
    }
  }

  static addCart(productId) async {
    var response = await ApiConnect.postData(
      LinkApp.addCart,
      data: {"product_id": productId},
      headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
    );
    if (response.statusCode == 201) {
      return StatusRequest.success;
    } else {
      return StatusRequest.failure;
    }
  }

  static updateCart(cartItemId, quantity) async {
    var response = await ApiConnect.postData(
      LinkApp.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
    );
    if (response.statusCode == 201) {
      return CartModel.fromJson(response.data);
    } else {
      return StatusRequest.failure;
    }
  }

  static removeCart(cartItemId) async {
    var response = await ApiConnect.postData(
      LinkApp.removeCart,
      data: {"cart_item_id": cartItemId},
      headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
    );
    if (response.statusCode == 200) {
      return CartModel.fromJson(response.data);
    } else {
      return StatusRequest.failure;
    }
  }
}

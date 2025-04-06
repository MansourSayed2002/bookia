import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/order/data/model/info_order_model/info_order_model.dart';
import 'package:bookia/feature/order/data/model/order_history_model/order_history_model.dart';

class OrderRepo {
  static getOrder() async {
    try {
      var response = await ApiConnect.getData(
        LinkApp.orderHistory,
        headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
      );
      if (response.statusCode == 200) {
        return OrderHistoryModel.fromJson(response.data);
      } else {
        return StatusRequest.failure;
      }
    } on Exception catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static getInfoOrder(id) async {
    try {
      var response = await ApiConnect.getData(
        LinkApp.onlyOrder + id.toString(),
        headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
      );
      if (response.statusCode == 200) {
        return InfoOrderModel.fromJson(response.data);
      } else {
        return StatusRequest.failure;
      }
    } on Exception catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}

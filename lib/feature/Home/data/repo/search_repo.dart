import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/Home/data/model/response/search_product_model/search_product_model.dart';

class SearchRepo {
  static search(String name) async {
    try {
      var response = await ApiConnect.getData(
        LinkApp.search,
        queryParameters: {"key": "Value", "name": name},
      );
      if (response.statusCode == 200) {
        return SearchProductModel.fromJson(response.data);
      } else {
        return StatusRequest.failure;
      }
    } on Exception catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}

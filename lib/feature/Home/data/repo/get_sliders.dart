import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/Home/data/model/response/sliders_model/sliders_model.dart';

class GetSliders {
  static getSliders() async {
    try {
      var response = await ApiConnect.getData(LinkApp.sliders);
      if (response.statusCode == 200) {
        return SlidersModel.fromJson(response.data);
      } else {
        return StatusRequest.failure;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

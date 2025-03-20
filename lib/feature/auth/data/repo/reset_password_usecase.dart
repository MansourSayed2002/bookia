import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params_model.dart';

class ResetPasswordUsecase {
  static resetPassword(AuthParamsModel resetPassModel) async {
    try {
      var response = await ApiConnect.postData(
        LinkApp.resetPassword,
        data: resetPassModel.toJson(),
      );
      if (response.statusCode == 200) {
        return StatusRequest.success;
      } else {
        return StatusRequest.failure;
      }
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}

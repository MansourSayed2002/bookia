import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';

class VerifycodeUsecase {
  static checkVerifyCode(String verifyCode, String email) async {
    try {
      var response = await ApiConnect.postData(
        LinkApp.checkforgetpassword,
        data: {"verify_code": verifyCode, "email": email},
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

import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';

class UpdatePassRepo {
  static updatePassword(
    String currentPassword,
    String newPassword,
    String newConfigPassword,
  ) async {
    try {
      var response = await ApiConnect.postData(
        LinkApp.updatePassword,
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
          "new_password_confirmation": newConfigPassword,
        },
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.getData('token')}",
        },
      );

      if (response.statusCode == 200) {
        return StatusRequest.success;
      } else {
        return StatusRequest.failure;
      }
    } on Exception catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}

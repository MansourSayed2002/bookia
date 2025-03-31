import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params_model.dart';
import 'package:bookia/feature/auth/data/model/response/users_model/users_model.dart';

class AuthUseCase {
  static register(AuthParamsModel user) async {
    try {
      var response = await ApiConnect.postData(
        LinkApp.register,
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        return StatusRequest.success;
      } else {
        return StatusRequest.failure;
      }
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }

  static login(AuthParamsModel login) async {
    try {
      var response = await ApiConnect.postData(
        LinkApp.login,
        data: login.toJson(),
      );
      if (response.statusCode == 200) {
        return UsersModel.fromJson(response.data);
      } else {
        return StatusRequest.failure;
      }
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}

import 'dart:developer';

import 'package:bookia/core/class/api_connect.dart';
import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/link_app.dart';
import 'package:bookia/feature/profile/data/model/profile_model/profile_model.dart';

class ProfileRepo {
  static getDataOfProfile() async {
    try {
      var response = await ApiConnect.getData(
        LinkApp.profile,
        headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
      );
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        return StatusRequest.failure;
      }
    } catch (e) {
      log(e.toString());
      return StatusRequest.failure;
    }
  }
}

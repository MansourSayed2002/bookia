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

  static updateProfile(name, address, phone) async {
    try {
      var response = await ApiConnect.postData(
        LinkApp.updateProfile,
        data: {"name": name, "address": address, "phone": phone},
        headers: {'Authorization': 'Bearer ${LocalStorage.getData('token')}'},
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

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/profile/data/model/profile_model/profile_model.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileModel? profileModel;
  var key = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  init(ProfileModel profileModel) {
    nameController.text = profileModel.data?.name ?? "";
    phoneController.text = profileModel.data?.phone ?? "";
    addressController.text = profileModel.data?.address ?? "";
  }

  getDataOfProfile() async {
    emit(ProfileLoading());
    await ProfileRepo.getDataOfProfile().then((value) {
      if (value is ProfileModel) {
        profileModel = value;
        emit(ProfileSuccess());
      } else {
        emit(ProfileError("Some Thing is Error"));
      }
    });
  }

  updateProfile() async {
    emit(ProfileLoading());
    await ProfileRepo.updateProfile(
      nameController.text,
      addressController.text,
      phoneController.text,
    ).then((value) {
      if (value == StatusRequest.success) {
        emit(ProfileSuccess());
      } else {
        emit(ProfileError("Some Thing is Error"));
      }
    });
  }

  valid() {
    if (key.currentState!.validate()) {
      updateProfile();
    } else {
      log("Validation");
    }
  }
}

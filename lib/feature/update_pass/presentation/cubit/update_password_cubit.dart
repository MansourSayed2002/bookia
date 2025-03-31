import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/feature/update_pass/data/repo/update_pass_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfigPassword = TextEditingController();

  var key = GlobalKey<FormState>();

  updatePassword() async {
    emit(UpdatePasswordLoading());

    await UpdatePassRepo.updatePassword(
      currentPassword.text,
      newPassword.text,
      newConfigPassword.text,
    ).then((value) {
      if (value == StatusRequest.success) {
        emit(UpdatePasswordSuccess());
      } else {
        emit(UpdatePasswordError(TextApp.someThingIsWrong));
      }
    });
  }

  valid() {
    if (key.currentState!.validate()) {
      updatePassword();
    } else {
      log("Validation");
    }
  }
}

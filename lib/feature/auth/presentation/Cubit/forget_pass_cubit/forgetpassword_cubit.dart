import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/auth/data/repo/verify_email_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());

  var key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  verifyEmail() async {
    emit(ForgetpasswordLoading());
    var response = await VerifyEmail.verifyEmail(email.text);
    if (response == StatusRequest.success) {
      emit(ForgetpasswordSuccess());
    } else {
      emit(ForgetpasswordError("Something Is Wrong"));
    }
  }

  valid() {
    if (key.currentState!.validate()) {
      verifyEmail();
    } else {
      log("validation");
    }
  }
}

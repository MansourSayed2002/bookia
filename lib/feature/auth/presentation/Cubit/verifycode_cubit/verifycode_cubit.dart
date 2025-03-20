import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/auth/data/repo/verifycode_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'verifycode_state.dart';

class VerifycodeCubit extends Cubit<VerifycodeState> {
  VerifycodeCubit() : super(VerifycodeInitial());

  var key = GlobalKey<FormState>();
  TextEditingController opt = TextEditingController();
  late String email;
  verifyEmail() async {
    emit(VerifycodeLoading());
    var response = await VerifycodeUsecase.checkVerifyCode(opt.text, email);
    if (response == StatusRequest.success) {
      emit(VerifycodeSuccess());
    } else {
      emit(VerifycodeError("Something Is Wrong"));
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

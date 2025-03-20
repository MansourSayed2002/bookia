import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params_model.dart';
import 'package:bookia/feature/auth/data/repo/reset_password_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());

  var key = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController configPassword = TextEditingController();
  late String opt;

  resetPassword() async {
    emit(ResetpasswordLoading());
    await ResetPasswordUsecase.resetPassword(
      AuthParamsModel(
        verifyCode: opt,
        newPassword: password.text,
        newPasswordConfirmation: configPassword.text,
      ),
    ).then((value) {
      if (value == StatusRequest.success) {
        emit(ResetpasswordSuccess());
      } else {
        emit(ResetpasswordError("Something Is Wrong"));
      }
    });
  }

  valid() {
    if (key.currentState!.validate()) {
      resetPassword();
    } else {
      log("validation");
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params_model.dart';
import 'package:bookia/feature/auth/data/model/response/users_model/users_model.dart';
import 'package:bookia/feature/auth/data/repo/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var key = GlobalKey<FormState>();
  bool isshow = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late UsersModel usersModel;
  logIn() async {
    emit(LoginLoading());
    var response = await AuthUseCase.login(
      AuthParamsModel(email: email.text, password: password.text),
    );
    if (response is StatusRequest) {
      emit(LoginError("Something is wrong"));
    } else {
      usersModel = response;
      emit(LoginSuccess());
    }
  }

  isShow() {
    isshow = !isshow;
    emit(IsShowPassword());
  }

  valid() {
    if (key.currentState!.validate()) {
      logIn();
    } else {
      log("validation");
    }
  }
}

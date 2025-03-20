import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bookia/core/constants/enum/status_request.dart';
import 'package:bookia/feature/auth/data/model/request/auth_params_model.dart';
import 'package:bookia/feature/auth/data/repo/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  var key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController configPassword = TextEditingController();

  register() async {
    emit(RegisterLoading());
    var response = await AuthUseCase.register(
      AuthParamsModel(
        name: name.text,
        email: email.text,
        password: password.text,
        passwordConfirmation: configPassword.text,
      ),
    );
    if (response == StatusRequest.success) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterError("Something went wrong"));
    }
  }

  valid() {
    if (key.currentState!.validate()) {
      register();
    } else {
      log("validation");
    }
  }
}

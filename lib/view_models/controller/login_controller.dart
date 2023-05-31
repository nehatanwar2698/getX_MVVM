import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/repositories/login_repository/login_repository.dart';

import '../../utility/utils.dart';

class LoginController extends GetxController {
  final _loginRepository = LoginRepository();
  final loginController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final loginFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  loginApi() {
    loading.value = true;
    Map data = {
      "email": loginController.value.text,
      "password": passwordController.value.text
    };
    _loginRepository.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == "user not found") {
        Utils.showSnakBar("Login", value['error']);
      } else {
        Utils.showSnakBar("Login", "Login Successfully");
      }
    }).onError((error, stackTrace) {
      loading.value = false;

      debugPrint(error.toString());
      Utils.showSnakBar("Login", error.toString());
    });
  }
}

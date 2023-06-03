import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/repositories/login_repository/login_repository.dart';
import 'package:getx_mvvm/model/login/login_res_model.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utility/user_preferences/user_pref_controller.dart';

import '../../../utility/utils.dart';

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
        UserPreference()
            .saveUser(LoginResponseModel.fromJson(value))
            .then((value) {
          // clear all resources
          Get.delete<LoginController>();

          // if data is save then what we do go to homescreen
          Get.toNamed(RoutesName.home_screen)!.then((value) {});
        }).onError((error, stackTrace) {
          //if error occur
          Utils.showSnakBar("Login", error.toString());
        });
        Utils.showSnakBar("Login", "Login Successfully");
      }
    }).onError((error, stackTrace) {
      loading.value = false;

      debugPrint(error.toString());
      Utils.showSnakBar("Login", error.toString());
    });
  }
}

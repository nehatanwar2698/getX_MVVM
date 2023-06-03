import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_controller.dart';

class LoginButtonWidget extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final formKey;

  LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
        title: 'login'.tr,
        width: 200,
        loading: loginController.loading.value,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            loginController.loginApi();
          }
        }));
  }
}

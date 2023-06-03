import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controller/login/login_controller.dart';

class InputPasswordField extends StatelessWidget {
  final loginController = Get.put(LoginController());

  InputPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.passwordController.value,
      focusNode: loginController.passwordFocusNode.value,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "password_hint".tr, border: OutlineInputBorder()),
    );
  }
}

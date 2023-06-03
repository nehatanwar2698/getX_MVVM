import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/utils.dart';
import '../../../view_models/controller/login/login_controller.dart';

class InputEmailField extends StatelessWidget {
  final loginController = Get.put(LoginController());

  InputEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.loginController.value,
      focusNode: loginController.loginFocusNode.value,
      onFieldSubmitted: (value) {
        debugPrint("on field submitted");
        Utils.fieldFocusChange(context, loginController.loginFocusNode.value,
            loginController.passwordFocusNode.value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          Utils.showSnakBar("Login", "please enter email");
        }
      },
      decoration: InputDecoration(
          hintText: "email_hint".tr, border: OutlineInputBorder()),
    );
  }
}

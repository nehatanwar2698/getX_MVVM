import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';

import '../../utility/utils.dart';
import '../../view_models/controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("login".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginController.loginController.value,
                    focusNode: loginController.loginFocusNode.value,
                    onFieldSubmitted: (value) {
                      debugPrint("on field submitted");
                      Utils.fieldFocusChange(
                          context,
                          loginController.loginFocusNode.value,
                          loginController.passwordFocusNode.value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.showSnakBar("Login", "please enter email");
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "email_hint".tr,
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: loginController.passwordController.value,
                    focusNode: loginController.passwordFocusNode.value,
                    obscureText: true,
                    obscuringCharacter: "a",
                    decoration: InputDecoration(
                        hintText: "password_hint".tr,
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() => RoundButton(
                title: 'login'.tr,
                width: 200,
                loading: loginController.loading.value,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginController.loginApi();
                  }
                }))
          ],
        ),
      ),
    );
  }
}

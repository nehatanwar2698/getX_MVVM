import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/login/widgets/login_button.dart';

import '../../view_models/controller/login/login_controller.dart';
import 'widgets/input_emall_field.dart';
import 'widgets/input_password_field.dart';

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
                  InputEmailField(),
                  SizedBox(
                    height: 16,
                  ),
                  InputPasswordField()
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            LoginButtonWidget(formKey: _formKey)
          ],
        ),
      ),
    );
  }
}

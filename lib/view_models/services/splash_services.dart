import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(RoutesName.login_screen );
    });
  }
}

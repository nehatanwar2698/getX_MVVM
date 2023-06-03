import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/utility/user_preferences/user_pref_controller.dart';

import '../../res/routes/routes_name.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();
  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      if (value.token!.isEmpty || value.token == null) {
        Timer(const Duration(seconds: 2), () {
          Get.toNamed(RoutesName.login_screen);
        });
      } else {
        Get.toNamed(RoutesName.home_screen);
      }
    });
  }
}

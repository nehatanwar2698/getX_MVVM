import 'package:get/get.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

import '../../view/login/login_view.dart';
import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splash_screen,
            page: () => SplashScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RoutesName.login_screen,
            page: () => LoginView(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        // GetPage(name: RoutesName.login_screen, page: () => ()),
      ];
}

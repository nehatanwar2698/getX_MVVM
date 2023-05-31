import 'package:flutter/material.dart';

import '../res/components/general_exception_widget.dart';
import '../utility/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return InternetExceptionWidget();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('email_hint'.tr),
      // ),
      body: GeneralExceptionWidget(
        onTap: () {},
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Utils.toastMessageCenter("hello");
        Utils.toastMessage("hi neha");
      }),
    );
  }
}

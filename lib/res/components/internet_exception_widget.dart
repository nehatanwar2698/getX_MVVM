import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart/app_colors.dart';

class InternetExceptionWidget extends StatefulWidget {
  VoidCallback onTap;
  InternetExceptionWidget({required this.onTap, super.key});

  @override
  _InternetExceptionWidgetState createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off,
              color: AppColors.SecondaryColor,
              size: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                "internet_exception".tr,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            ElevatedButton(
              onPressed: widget.onTap,
              child: Text("Retry"),
            ),
          ],
        ));
  }
}

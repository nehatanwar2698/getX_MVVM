import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors.dart/app_colors.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {super.key,
      this.loading = false,
      required this.title,
      this.height = 50,
      this.width = 60,
      this.buttonColor = AppColors.primaryButtonColor,
      this.textColor = AppColors.blackColor,
      required this.onPressed});

  final bool loading;

  final String title;
  final double? height, width;
  VoidCallback onPressed;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: loading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            )),
    );
  }
}

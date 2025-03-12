import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.buttonColor,
  });

  final String text;
  final void Function() onPressed;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 320.w,
      height: 40.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      onPressed: onPressed,
      color: buttonColor,
      child: Text(text, style: TextStyle(color: textColor, fontSize: 20.sp)),
    );
  }
}

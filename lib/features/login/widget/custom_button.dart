import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 250.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      onPressed: onPressed,
      color: const Color(0xff003367),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20.sp)),
    );
  }
}

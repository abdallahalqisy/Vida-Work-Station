import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.minWidth,
    required this.color,
  });
  final String text;
  final int minWidth;
  final Color color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      onPressed: onPressed,
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

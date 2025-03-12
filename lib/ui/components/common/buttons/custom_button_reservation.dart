import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.minWidth,
    required this.color,
    required this.textColor,
    required this.borderColor,
  });

  final String text;
  final int minWidth;
  final Color color;
  final void Function() onPressed;
  final Color textColor;

  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0.w),
      child: MaterialButton(
        minWidth: minWidth.w,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(color: borderColor, width: 1.w),
        ),
        onPressed: onPressed,
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTixtFormField extends StatelessWidget {
  const CustomTixtFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
  });
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText, //
          hintStyle: TextStyle(color: Color(0xff003367)),
        ),
      ),
    );
  }
}

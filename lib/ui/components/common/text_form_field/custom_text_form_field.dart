import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.hintText,
    required this.onChanged,
    required this.textInputAction,
    required this.validator,
    required this.icon,
  });

  final String labelText;
  final String hintText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final IconData? icon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  final GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        key: fieldKey,
        obscuringCharacter: '*',
        keyboardType: TextInputType.text,
        onChanged: (value) {
          widget.onChanged?.call(value);
          fieldKey.currentState?.validate();
        },
        obscureText: _obscureText,
        textInputAction: widget.textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: colorScheme.primary, width: 2.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: colorScheme.primary, width: 2.w),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Color(0xff003367), fontSize: 15.sp),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xff003367), fontSize: 15.sp),
          suffixIcon:
              (widget.obscureText)
                  ? IconButton(
                    icon:
                        _obscureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null,
          prefixIcon: Icon(widget.icon, color: colorScheme.primary),
        ),
      ),
    );
  }
}

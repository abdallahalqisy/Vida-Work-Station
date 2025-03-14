import 'package:flutter/material.dart';

class TextFormFieldReservation extends StatelessWidget {
  const TextFormFieldReservation({
    super.key,
    required this.hintText,
    required this.direction1,
    required this.direction2,
    required this.controller,
    required this.maxLines,
    required this.keyboardType,
    required this.width,
    required this.height,
    required this.textInputAction,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  final TextDirection direction1;
  final TextDirection direction2;
  final TextInputType keyboardType;
  final double width;

  final double height;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        textDirection: direction1,
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          hintTextDirection: direction2,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

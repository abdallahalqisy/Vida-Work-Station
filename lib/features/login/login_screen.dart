import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/features/home/home_screen.dart';
import 'package:vida/features/login/widget/custom_button.dart';
import 'package:vida/features/login/widget/custom_text_form_field.dart';
import 'package:vida/features/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Image.asset(
                  'assets/images/logo.png',
                  width: 150.w,
                  height: 150.h,
                ),
                SizedBox(height: 130.h),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff003367),
                  ),
                ),
                SizedBox(height: 50.h),
                CustomTextFormField(
                  hintText: 'Test@gmail,com',
                  labelText: 'Email',
                  obscureText: false,
                  onChanged: (data) {
                    email = data;
                  },
                  textInputAction: TextInputAction.next,
                  autoValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  icon: Icons.email_rounded,
                ),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  hintText: '********',
                  obscureText: true,
                  labelText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                  textInputAction: TextInputAction.done,
                  autoValidate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  icon: Icons.lock,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    // }
                  },
                  textColor: colorScheme.shadow,
                  buttonColor: colorScheme.primary,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: colorScheme.primary,
                        thickness: 1.w,
                        indent: 20.w,
                        endIndent: 10.w,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff003367),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: const Color(0xff003367),
                        thickness: 1.w,
                        indent: 10.w,
                        endIndent: 20.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  textColor: colorScheme.primary,
                  buttonColor: Colors.white54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

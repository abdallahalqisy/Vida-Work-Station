import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/services/api_services/auth_services.dart';
import 'package:vida/ui/components/common/buttons/custom_button_authentication.dart';
import 'package:vida/ui/components/common/text_form_field/custom_text_form_field_auth.dart';
import 'package:vida/ui/screens/app/home/home_screen.dart';
import 'package:vida/ui/screens/onboarding/signup_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  String? email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 50.h),
          Image.asset('assets/images/logo.png', width: 150.w, height: 150.h),
          SizedBox(height: 130.h),
          Text(
            'Login to your account',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 50.h),
          CustomTextFormField(
            hintText: 'Test@gmail.com',
            labelText: 'Email',
            obscureText: false,
            onChanged: (data) {
              email = data;
            },
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
              ).hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
            icon: Icons.email_rounded,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            hintText: '**********',
            obscureText: true,
            labelText: 'Password',
            onChanged: (data) {
              password = data;
            },
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6 &&
                  value.contains(RegExp(r'[@#$&]'))) {
                return 'Password must be at least 6 characters and Special characters like @, #,\$ ,  & are allowed';
              }
              return null;
            },
            icon: Icons.lock,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            text: 'Login',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  final result = await AuthServices().loginUser({
                    'email': email,
                    'password': password,
                  });

                  if (context.mounted) {
                    if (result is Map<String, dynamic>) {
                      // ✅ Successful login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else if (result is String) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                } catch (e) {
                  log('Unexpected error: $e');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("An unexpected error occurred."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }
            },

            textColor: colorScheme.shadow,
            buttonColor: colorScheme.surface,
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
                  color: colorScheme.primary,
                ),
              ),
              Expanded(
                child: Divider(
                  color: colorScheme.primary,
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
    );
  }
}

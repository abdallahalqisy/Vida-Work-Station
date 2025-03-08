import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/screens/app/home/home_screen.dart';
import 'package:vida/ui/components/common/button/custom_button.dart';
import 'package:vida/ui/components/common/text_form_field/custom_text_form_field.dart';
import 'package:vida/ui/screens/onboarding/login_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  String? name, email, password;

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
            'Create New account',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 50.h),
          CustomTextFormField(
            labelText: 'Name',
            hintText: 'John Doe',
            onChanged: (data) {
              setState(() {
                name = data;
              });
            },
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            icon: Icons.person,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            hintText: 'Test@gmail.com',
            labelText: 'Email',
            obscureText: false,
            onChanged: (data) {
              setState(() {
                email = data;
              });
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
              setState(() {
                password = data;
              });
            },
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            icon: Icons.lock,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            text: 'Sign up',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
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
            text: 'Login',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
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

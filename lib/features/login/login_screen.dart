import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/features/home/home_screen.dart';
import 'package:vida/features/login/widget/custom_button.dart';
import 'package:vida/features/login/widget/custom_text_form_field.dart'; // تأكد من أن المسار صحيح

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Image.asset(
                'assets/images/logo.png',
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(height: 100.h),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff003367),
                ),
              ),
              SizedBox(height: 50.h),
              CustomTixtFormField(hintText: 'Email'),
              SizedBox(height: 20.h),
              CustomTixtFormField(hintText: 'Password', obscureText: true),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              SizedBox(height: 130.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(onPressed: () {}, child: Text('Sign up')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

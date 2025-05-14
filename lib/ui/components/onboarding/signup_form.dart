import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/auth_cubit/app_stata.dart';
import 'package:vida/auth_cubit/auth_cubit.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/loading.dart';
import 'package:vida/ui/screens/app/home/home_screen.dart';
import 'package:vida/ui/components/common/buttons/custom_button_authentication.dart';
import 'package:vida/ui/components/common/text_form_field/custom_text_form_field_auth.dart';
import 'package:vida/ui/screens/onboarding/login_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  String? name, email, password, phone;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FailedToRegisterState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is RegisterSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterLoadingState) {
          return const Center(child: PulseLoadingIndicator());
        }
        return Form(
          key: formKey,
          child: SingleChildScrollView(
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
                  'Create New account',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                SizedBox(height: 25.h),
                CustomTextFormField(
                  labelText: 'Name',
                  hintText: 'John Doe',
                  initialValue: name, // Retain the value
                  onChanged: (data) {
                    name = data;
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
                  labelText: 'Phone Number',
                  hintText: '+201234567890',
                  initialValue: phone, // Retain the value
                  onChanged: (data) {
                    phone = data;
                  },
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    return null;
                  },
                  icon: Icons.phone,
                ),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  hintText: 'Test@gmail.com',
                  labelText: 'Email',
                  obscureText: false,
                  initialValue: email, // Retain the value
                  onChanged: (data) {
                    email = data;
                  },
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
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
                  initialValue: password, // Retain the value
                  onChanged: (data) {
                    password = data;
                  },
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Check if the password is at least 6 characters long
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    // Check if the password contains at least one letter
                    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                      return 'Password must contain at least one letter';
                    }
                    // Check if the password contains at least one special character
                    if (!RegExp(r'[@#$&]').hasMatch(value)) {
                      return 'Password must contain at least one special character (@, #, \$, &)';
                    }
                    return null;
                  },
                  icon: Icons.lock,
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  text: 'Sign up',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await cubit.registerUser(
                          name!,
                          password!,
                          email!,
                          phone!,
                        );
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
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BlocProvider(
                              create: (context) => AuthCubit(),
                              child: LoginScreen(),
                            ),
                      ),
                    );
                  },
                  textColor: colorScheme.primary,
                  buttonColor: Colors.white54,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

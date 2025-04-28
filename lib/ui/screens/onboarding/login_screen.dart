import 'package:flutter/material.dart';
import 'package:vida/ui/components/onboarding/login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Login_.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: LoginForm(),
        ),
      ),
    );
  }
}

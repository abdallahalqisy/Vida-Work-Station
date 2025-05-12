import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vida/ui/components/onboarding/signup_form.dart';
import 'package:vida/auth_cubit/auth_cubit.dart';
import 'package:vida/auth_cubit/app_stata.dart';
import 'package:vida/ui/components/common/loading.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state is RegisterLoadingState;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Login_.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SignupForm(),
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.blueAccent.withOpacity(0.5),
                  child: const Center(child: PulseLoadingIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}

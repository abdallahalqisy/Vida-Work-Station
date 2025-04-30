import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vida/auth_cubit/auth_cubit.dart';
import 'package:vida/ui/screens/app/home/home_screen.dart';
import 'package:vida/ui/screens/onboarding/login_screen.dart';

void main() {
  runApp(const VidaApp());
}

class VidaApp extends StatelessWidget {
  const VidaApp({super.key});

  Future<Widget> _getInitialScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      return HomeScreen();
    } else {
      return BlocProvider(
        create: (context) => AuthCubit(),
        child: LoginScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<Widget>(
            future: _getInitialScreen(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return const Scaffold(
                  body: Center(child: Text('Something went wrong')),
                );
              } else {
                return snapshot.data!;
              }
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/features/home/home_screen.dart';

void main() {
  runApp(const VidaApp());
}

class VidaApp extends StatelessWidget {
  const VidaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,

      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}

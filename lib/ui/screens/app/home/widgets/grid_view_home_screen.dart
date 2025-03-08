import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewInHomeScreen extends StatelessWidget {
  GridViewInHomeScreen({super.key});

  final List<String> images = [
    'assets/images/coming_events.png',
    'assets/images/قاعه التدريبات.png',
    'assets/images/قاعه الاجتماعات.jpeg',
    'assets/images/courses.jpg',
  ];
  final List<String> titel = [
    'Coming events',
    'قاعات التدريب',
    'قاعات الاجتماعات',
    'courses',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: titel.length, // Number of items
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(images[index % 4], width: 100.w, height: 100.h),
              Text(
                titel[index % 4],
                style: TextStyle(
                  color: Color(0xff003367),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

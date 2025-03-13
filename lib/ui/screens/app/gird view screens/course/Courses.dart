import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/course/courses/business.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/course/courses/coding.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/course/courses/english.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/course/courses/graphics.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/course/courses/media.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/course/courses/soft%20skills.dart';

class Courses extends StatelessWidget {
  Courses({super.key});

  final List<String> images = [
    'assets/images/business.jpeg',
    'assets/images/soft_skills.png',
    'assets/images/graphics.png',
    'assets/images/english.jpeg',
    'assets/images/media.jpg',
    'assets/images/coding.jpeg',
  ];
  final List<String> title = [
    'business',
    'soft skills',
    'graphics',
    'english',
    'media',
    'coding'
  ];

  final List<Widget> pages = [
    const Business(),
    const SoftSkills(),
    const Graphics(),
    const English(),
    const Media(),
    const Coding(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(
          "courses",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: title.length,
              // Number of items
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
                      Image.asset(images[index % 6], width: 100.w, height: 100.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pages[index % 6]),
                          );
                        },
                        child: Text(
                          title[index % 6],
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
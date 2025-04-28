import 'package:flutter/material.dart';
import 'package:vida/models/courses_model/courses_model.dart';
import 'package:vida/services/api_services/course_services.dart';
import 'package:vida/ui/components/common/list_view_builder/list_vew_builder_course.dart';
import 'package:vida/ui/components/common/loading.dart';

class ComingEvents extends StatelessWidget {
  const ComingEvents({super.key});

  Future<List<CoursesModel>> fetchComingEventsCourses() async {
    final allCourses = await CourseServices().fetchCourses();
    return allCourses
        .where((course) => course.type?.toLowerCase() == 'coming events')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoursesModel>>(
      future: fetchComingEventsCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingScreen());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No Coming Events Courses available.'),
          );
        } else {
          return ListViewBuildCourse(courseList: snapshot.data!);
        }
      },
    );
  }
}

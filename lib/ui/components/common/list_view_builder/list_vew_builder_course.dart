import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/models/courses_model/courses_model.dart';
import 'package:vida/ui/components/common/body/container_body.dart';
import 'package:vida/ui/components/common/reservation_builder/reservation_builder_course.dart';

class ListViewBuildCourse extends StatelessWidget {
  const ListViewBuildCourse({super.key, required this.courseList});

  final List<CoursesModel> courseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(
          courseList.isNotEmpty ? courseList[0].type! : 'Courses',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
        child: ListView.builder(
          itemCount: courseList.length,
          itemBuilder: (context, index) {
            final course = courseList[index];
            return ContainerBody(
              image: course.imageUrl!,
              title: course.title!,
              description: course.description!,
              description2: course.instructorEmail!,
              number: 5,
              // You can put course.maxParticipants here
              price: course.price!,
              onPressed:
                  course.isActive!
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ReservationBuilderCourse(course: course),
                          ),
                        );
                      }
                      : () {},
              buttonColor: course.isActive! ? colorScheme.surface : Colors.grey,
            );
          },
        ),
      ),
    );
  }
}

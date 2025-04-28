import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/models/courses_model/courses_model.dart';
import 'package:vida/ui/components/common/body/container_body_reservation.dart';
import 'package:vida/ui/components/common/body/custom_tab_bar.dart';
import 'package:vida/ui/components/common/coming_event/event_info.dart';
import 'package:vida/ui/components/common/coming_event/event_reservation.dart';

class ReservationBuilderCourse extends StatelessWidget {
  const ReservationBuilderCourse({super.key, required this.course});

  final CoursesModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text(
          'Reservation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ContainerBodyReservation(
            title: course.title!,
            subTitle: course.type!,
            description: course.description!,
            number: 5,
            image: course.imageUrl!,
            details: course.isActive! ? 'Active Course' : 'Inactive Course',
            price: course.price!,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.shadow,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CustomTabBar(
                tabBarViews: [
                  EventReservation(),
                  EventReservation(),
                  EventInfo(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

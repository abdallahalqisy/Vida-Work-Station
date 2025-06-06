import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/body/container_body_reservation.dart';
import 'package:vida/ui/components/common/body/custom_tab_bar.dart';
import 'package:vida/ui/components/common/coming_event/event_info.dart';
import 'package:vida/ui/components/common/coming_event/event_reservation.dart';
import 'package:vida/ui/screens/app/gird_view_screens/info_category.dart';

class ReservationBuilder extends StatelessWidget {
  const ReservationBuilder({super.key, required this.info});

  final InfoCategory info;

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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ContainerBodyReservation(
            title: info.title,
            subTitle: info.description,
            description: info.description2,
            number: info.number,
            image: info.image,
            details: 'غير متاحه للحجز',
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
                  EventReservation(), // Dynamic height
                  EventReservation(), // Dynamic height
                  EventInfo(), // Shorter height
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

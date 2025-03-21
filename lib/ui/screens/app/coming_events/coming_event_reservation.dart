import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/body/container_body_reservation.dart';
import 'package:vida/ui/components/common/body/custom_tab_bar.dart';
import 'package:vida/ui/components/common/coming_event/event_info.dart';
import 'package:vida/ui/components/common/coming_event/event_reservation.dart';

class ComingEventReservation extends StatelessWidget {
  const ComingEventReservation({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerBodyReservation(
              title: 'Coming events',
              subTitle: 'الرواق الفلسفى ',
              description: 'Friday ,22 September',
              number: 4,
              image: 'assets/images/coming_event_body.jpg',
              details: 'غير متاحه للحجز',
            ),
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                constraints: BoxConstraints(minHeight: 400.h, maxHeight: 460.h),
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
      ),
    );
  }
}

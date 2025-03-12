import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/body/container_body.dart';
import 'package:vida/ui/screens/app/coming_events/coming_event_reservation.dart';

class ComingEvents extends StatelessWidget {
  const ComingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: const Text(
          'Coming Events',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
        child: ContainerBody(
          image: 'assets/images/coming_event_body.jpg',
          title: 'Coming Events',
          description: 'الرواق الفلسفى ',
          description2: 'Friday ,22 September',
          number: 4,
          price: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ComingEventReservation(),
              ),
            );
          },
        ),
      ),
    );
  }
}

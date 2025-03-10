import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/ui/components/common/buttons/custom_button_reservation.dart';

class CustomListView extends StatelessWidget {
  CustomListView({super.key});

  final List<String> images = [
    'assets/images/work_brain.jpg',
    'assets/images/vip.jpg',
    'assets/images/grow.jpg',
    'assets/images/speak.jpg',
  ];
  final List<String> subtitle = [
    'قاعات اجتماعات مجهزه',
    'قاعات اجتماعات مجهزه',
    'قاعات تدريبات مجهزه',
    'قاعات مخصصه للتدريب',
  ];
  final List<String> titel = [
    'Work Brain',
    'Vip Venue',
    'Grow Venue',
    'Speakmuch',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: titel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: 150.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(images[index], width: 100.w, height: 80.h),
                SizedBox(height: 8.h),
                ListTile(
                  title: Text(
                    titel[index % 4],
                    style: TextStyle(
                      color: Color(0xff003367),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    overflow: TextOverflow.ellipsis,
                    subtitle[index],
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ),
                CustomButton(
                  color: const Color(0xff39A0BD),
                  minWidth: 100,
                  text: 'احجز الان',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/buttons/custom_button_reservation.dart';

class CustomListView extends StatelessWidget {
  CustomListView({super.key});

  final List<String> images = [
    'assets/images/woke_brain.jpg',
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
  final List<String> title = [
    'Work Brain',
    'Vip Venue',
    'Grow Venue',
    'Speak much',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: title.length,
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
                Image.asset(images[index], width: 100.w, height: 100.h),
                Expanded(
                  child: ListTile(
                    title: Text(
                      title[index % 4],
                      style: TextStyle(
                        color: colorScheme.primary,
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

                ),
                CustomButton(
                  color: colorScheme.surface,
                  minWidth: 100,
                  text: 'احجز الان',
                  onPressed: () {},
                  textColor: colorScheme.shadow,
                  borderColor: colorScheme.surface,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

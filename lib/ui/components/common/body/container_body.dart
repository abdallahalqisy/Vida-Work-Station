import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/buttons/custom_button_reservation.dart';

class ContainerBody extends StatelessWidget {
  const ContainerBody({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.description2,
    required this.number,
    required this.price,
    required this.onPressed,
  });

  final String image;
  final String title;
  final String description;
  final String description2;
  final int number;
  final int price;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 390.h,
      decoration: BoxDecoration(
        color: colorScheme.shadow,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0.h, bottom: 10.h),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                height: 180.h,
                width: 200.w,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.surface,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.check_circle, color: Colors.teal, size: 16),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              description,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description2,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                number,
                (index) =>
                    const Icon(Icons.star, color: Colors.amber, size: 20),
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vida WorkStation",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.location_on, color: Colors.grey, size: 18),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$price EGP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  minWidth: 100,
                  text: 'احجز الان ',
                  color: colorScheme.surface,
                  onPressed: onPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

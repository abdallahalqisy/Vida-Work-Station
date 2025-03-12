import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/buttons/custom_button_reservation.dart';

class ContainerBodyReservation extends StatelessWidget {
  const ContainerBodyReservation({
    super.key,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.number,
    required this.image,
    required this.details,
  });

  final String title;
  final String subTitle;
  final String description;
  final int number;
  final String image;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        width: double.infinity,
        height: 180.h,
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
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
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
                          const Icon(
                            Icons.check_circle,
                            color: Colors.teal,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          number,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Vida WorkStation",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                      height: 120.h,
                      width: 130.w,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomButton(
                    text: details,
                    onPressed: () {},
                    minWidth: 100,
                    color: colorScheme.surface,
                    textColor: colorScheme.shadow,
                    borderColor: colorScheme.surface,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'سعه الاشخاص:50',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  Icon(Icons.bookmark_border),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

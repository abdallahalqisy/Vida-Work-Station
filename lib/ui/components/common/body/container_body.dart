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
    required this.buttonColor,
  });

  final String image;
  final String title;
  final String description;
  final String description2;
  final int number;
  final int price;
  final Function() onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    final heightContainer = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        width: 220.w,
        height: heightContainer * 0.5,
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
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  height: 180.h,
                  width: 200.w,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                textAlign: TextAlign.center,
                description,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
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
              CustomButton(
                minWidth: 100,
                text: 'احجز الان ',
                color: buttonColor,
                onPressed: onPressed,
                textColor: colorScheme.shadow,
                borderColor: colorScheme.surface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    this.price,
    this.capacity,
    required this.onPressed,
    required this.buttonColor,
  });

  final String image;
  final String title;
  final String description;
  final String description2;
  final int number;
  final double? price;
  final int? capacity;
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
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  height: 160.h,
                  width: 200.w,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120.h,
                      width: 160.w,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  textAlign: TextAlign.start,
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),

              (price != null)
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$price EGP",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$capacity",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      Icon(Icons.signpost_outlined, color: Colors.grey[700]),
                    ],
                  ),

              const SizedBox(height: 3),

              CustomButton(
                minWidth: 100,
                text: 'احجز الان',
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

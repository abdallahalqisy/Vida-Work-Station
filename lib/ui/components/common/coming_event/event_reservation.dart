import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/buttons/custom_button_reservation.dart';
import 'package:vida/ui/components/common/text_form_field/text_form_field_reservation.dart';
import 'package:vida/ui/components/common/time_reservation.dart';

class EventReservation extends StatelessWidget {
  EventReservation({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BookingScreen(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextFormFieldReservation(
                    hintText: 'الاسم بالكامل',
                    direction1: TextDirection.rtl,
                    direction2: TextDirection.rtl,
                    controller: nameController,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    width: width * 0.54,
                    height: 80,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء ادخال الاسم';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(width: 10),
                  TextFormFieldReservation(
                    hintText: 'عدد الافراد',
                    direction1: TextDirection.ltr,
                    direction2: TextDirection.ltr,
                    controller: numberController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    width: width * 0.33,
                    height: 80,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      int? number = int.tryParse(value!);
                      if (number == null || number <= 0) {
                        return 'الرجاء ادخال عدد صحيح موجب';
                      }
                      if (value.isEmpty) {
                        return 'الرجاء ادخال عدد الافراد';
                      }

                      return null;
                    },
                  ),
                ],
              ),

              TextFormFieldReservation(
                hintText: 'البريد الالكتروني',
                direction1: TextDirection.ltr,
                direction2: TextDirection.ltr,
                controller: emailController,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                width: 390,
                height: 80,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء ادخال البريد الالكترونى';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(value)) {
                    return 'الايميل غير صحيح';
                  }
                  return null;
                },
              ),

              TextFormFieldReservation(
                hintText: 'رقم الهاتف',
                direction1: TextDirection.rtl,
                direction2: TextDirection.rtl,
                controller: phoneController,
                maxLines: 1,
                keyboardType: TextInputType.phone,
                width: 390,
                height: 80,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "يرجى إدخال رقم الهاتف";
                  }
                  if (!RegExp(r'^[0-9]{8,15}$').hasMatch(value)) {
                    return "رقم الهاتف غير صحيح";
                  }
                  return null;
                },
              ),

              TextFormFieldReservation(
                hintText: 'ملاحظات',
                direction1: TextDirection.rtl,
                direction2: TextDirection.rtl,
                controller: noteController,
                maxLines: 4,
                keyboardType: TextInputType.text,
                width: 390,
                height: 120,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'تاكيد الحجز',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Do something with the form data
                      }
                    },
                    minWidth: 100,
                    color: colorScheme.surface,
                    textColor: colorScheme.shadow,
                    borderColor: colorScheme.surface,
                  ),
                  CustomButton(
                    text: 'امسح',
                    onPressed: () {
                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
                      noteController.clear();
                      numberController.clear();
                    },
                    minWidth: 100,
                    color: colorScheme.shadow,
                    textColor: colorScheme.surface,
                    borderColor: colorScheme.surface,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

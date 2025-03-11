import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/buttons/custom_button_reservation.dart';
import 'package:vida/ui/components/common/coming_event/event_info.dart';

class ComingEventReservation extends StatefulWidget {
  const ComingEventReservation({super.key});

  @override
  State<ComingEventReservation> createState() => _ComingEventReservationState();
}

class _ComingEventReservationState extends State<ComingEventReservation>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                                    'Coming events',
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
                                'الرواق الفلسفي ',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Friday ,22 September',
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
                                  4,
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
                              'assets/images/coming_event_body.jpg',
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
                            text: 'غير متاحه للحجز ',
                            onPressed: () {},
                            minWidth: 100,
                            color: colorScheme.surface,
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
            ),
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                constraints: BoxConstraints(minHeight: 400.h, maxHeight: 550.h),
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
                child: Column(
                  children: [
                    TabBar(
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      indicatorColor: colorScheme.surface,
                      labelColor: colorScheme.surface,
                      unselectedLabelColor: colorScheme.primary,
                      tabs: const <Widget>[
                        Tab(
                          child: Text(
                            'تقييم',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'احجز الان',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'معلومات',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const <Widget>[
                          Center(child: Text("It's rainy here")),
                          Center(child: Text("It's sunny here")),
                          EventInfo(),
                        ],
                      ),
                    ),
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

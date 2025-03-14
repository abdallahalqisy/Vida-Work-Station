import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key, required this.tabBarViews});

  List<Widget> tabBarViews = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Column(
        children: [
          TabBar(
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.tab,

            indicatorColor: colorScheme.surface,
            labelColor: colorScheme.surface,
            unselectedLabelColor: colorScheme.primary,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  'تقييم',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Tab(
                child: Text(
                  'احجز الان',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Tab(
                child: Text(
                  'معلومات',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: TabBarView(children: tabBarViews),
            ),
          ),
        ],
      ),
    );
  }
}

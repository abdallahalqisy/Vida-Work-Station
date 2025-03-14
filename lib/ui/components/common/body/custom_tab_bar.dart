import 'package:flutter/material.dart';
import 'package:vida/constants/theme.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.tabBarViews});

  final List<Widget> tabBarViews;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _containerHeight = 800; // Default height

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_updateHeight);
  }

  void _updateHeight() {
    final height = MediaQuery.of(context).size.height;
    setState(() {
      if (_tabController.index == 0) {
        _containerHeight = height * 0.8; // Height for 'تقييم'
      } else if (_tabController.index == 1) {
        _containerHeight = height * 0.8; // Height for 'احجز الان'
      } else {
        _containerHeight = height * 0.5; // Height for 'معلومات'
      }
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_updateHeight);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _containerHeight,
            // Dynamic height based on the selected tab
            child: TabBarView(
              controller: _tabController,
              children: widget.tabBarViews,
            ),
          ),
        ],
      ),
    );
  }
}

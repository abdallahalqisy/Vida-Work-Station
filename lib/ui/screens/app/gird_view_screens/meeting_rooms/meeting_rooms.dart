import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/gird_view_screens/ListViewBuilder.dart';
import 'package:vida/ui/screens/app/gird_view_screens/info_category.dart';

class MeetingRooms extends StatelessWidget {
  const MeetingRooms({super.key});

    final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/vip.jpg',
      title: "قاعات الاجتماعات",
      description: "Vip Venue",
      description2: "قاعة اجتماعات مجهزة",
      number: 5,
      price: 9,
    ),
    InfoCategory(
      image: 'assets/images/woke_brain.jpg',
      title: "قاعات التدريب",
      description: "Woke Brain",
      description2: "قاعة اجتماعات مجهزة",
      number: 5,
      price: 14,
    ),
  ];
  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder(infoList: infoList);
  }
}


import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/ListViewBuilder.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/info_category.dart';


class TrainingRooms extends StatelessWidget {
  const TrainingRooms({super.key});
  // make title here

  final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/speak.jpg',
      title: "قاعات التدريب",
      description: "Speakmuch",
      description2: "قاعات مخصصة للتدريب",
      number: 5,
      price: 25,
    ),
    InfoCategory(
      image: 'assets/images/grow.jpg',
      title: "قاعات التدريب",
      description: "Grow Venue",
      description2: "قاعة تدريب مجهزة",
      number: 5,
      price: 50,
    ),
  ];
  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder(infoList: infoList);
  }
}

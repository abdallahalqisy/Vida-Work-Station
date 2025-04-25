import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/ListViewBuilder.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/info_category.dart';

class Coding extends StatelessWidget {
  const Coding({super.key});

  final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/coding.jpeg',
      title: "Coding",
      description: "Project Management",
      description2: "Vida's community",
      number: 5,
      price: 15,
    ),
    InfoCategory(
      image: 'assets/images/Basics in robotics.jpeg',
      title: "Coding",
      description: "Basics in robotics",
      description2: "Basics in robotics",
      number: 5,
      price: 25,
    ),
  ];

  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    // return ListViewBuilder(infoList: infoList);
    return Text('data');
  }
}

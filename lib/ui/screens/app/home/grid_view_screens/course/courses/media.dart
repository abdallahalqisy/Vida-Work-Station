import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/ListViewBuilder.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/info_category.dart';

class Media extends StatelessWidget {
  const Media({super.key});

  final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/Photography.jpeg',
      title: "Media",
      description: "Photography",
      description2: "Photography",
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

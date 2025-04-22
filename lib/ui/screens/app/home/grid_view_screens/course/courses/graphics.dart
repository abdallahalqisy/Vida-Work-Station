import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/ListViewBuilder.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/info_category.dart';

class Graphics extends StatelessWidget {
  const Graphics({super.key});

    final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/UX Design.jpeg',
      title: "Graphics",
      description: "UX Design",
      description2: "UX Design for Beginners",
      number: 4,
      price: 20,
    ),
    InfoCategory(
      image: 'assets/images/Graphic design.jpeg',
      title: "Graphics",
      description: "Graphic design",
      description2: "Graphic design",
      number: 5,
      price: 15,
    ),
  ];
  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder(infoList: infoList);
  }
  }

import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/info%20category.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/ListViewBuilder.dart';

class English extends StatelessWidget {
  const English({super.key});

    final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/IELTS.jpg',
      title: "English",
      description: "IELTS",
      description2: "ENGLISH",
      number: 5,
      price: 15,
    ),
    InfoCategory(
      image: 'assets/images/Level1.jpg',
      title: "English",
      description: "Level1",
      description2: "ENGLISH",
      number: 5,
      price: 55,
    ),
  ];
  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    return Listviewbuilder(infoList: infoList);
  }
  }

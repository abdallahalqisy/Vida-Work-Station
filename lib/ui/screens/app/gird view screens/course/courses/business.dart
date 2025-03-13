import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/info%20category.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/ListViewBuilder.dart';

class Business extends StatelessWidget {
  const Business({super.key});

    final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/Project Management.jpg',
      title: "Business",
      description: "Project Management",
      description2: "Vida's community",
      number: 5,
      price: 25,
    ),
    InfoCategory(
      image: 'assets/images/Digital Marketing.jpeg',
      title: "Business",
      description: "Digital Marketing",
      description2: "Vida's community",
      number: 5,
      price: 20,
    ),
  ];
  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    return Listviewbuilder(infoList: infoList);
  }
  }

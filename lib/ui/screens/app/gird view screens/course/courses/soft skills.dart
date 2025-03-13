import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/info%20category.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/ListViewBuilder.dart';

class SoftSkills extends StatelessWidget {
  const SoftSkills({super.key});

    final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/Pharmaceutical selling.jpeg',
      title: "Soft skills",
      description: "Pharmaceutical selling skills",
      description2: "Pharmaceutical selling skills",
      number: 5,
      price: 15,
    )
  ];
  // make it scroll with same as events
  //make info scroll
  @override
  Widget build(BuildContext context) {
    return Listviewbuilder(infoList: infoList);
  }
  }

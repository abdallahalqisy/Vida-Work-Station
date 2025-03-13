import 'package:flutter/material.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/info%20category.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/ListViewBuilder.dart';

class ComingEvents extends StatelessWidget {
  const ComingEvents({super.key});

  final List<InfoCategory> infoList = const [
    InfoCategory(
      image: 'assets/images/coming_event_body.jpg',
      title: 'Coming Events',
      description: 'الرواق الفلسفى',
      description2: 'Friday ,22 September',
      number: 4,
      price: 50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Listviewbuilder(infoList: infoList); 
  }
}

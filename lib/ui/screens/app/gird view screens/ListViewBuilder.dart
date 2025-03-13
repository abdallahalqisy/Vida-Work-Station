import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/components/common/body/container_body.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/info%20category.dart';
import 'package:vida/ui/screens/app/gird%20view%20screens/ReservationBuilder.dart';

class Listviewbuilder extends StatelessWidget {
  const Listviewbuilder({super.key, required this.infoList});
  // make title here

  final List<InfoCategory> infoList ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(
          infoList[0].title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
        child: ListView.builder(
          itemCount: infoList.length,
          itemBuilder: (context, index) {
            return ContainerBody(
              image: infoList[index].image,
              title: infoList[index].title,
              description: infoList[index].description,
              description2: infoList[index].description2,
              number: infoList[index].number,
              price: infoList[index].price,
              onPressed: () {
                InfoCategory info = infoList[index];
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Reservationbuilder(info: info),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
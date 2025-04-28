import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/models/space_model.dart';
import 'package:vida/ui/components/common/body/container_body.dart';
import 'package:vida/ui/components/common/reservation_builder/reservation_builder_space.dart';

class ListViewBuildSpace extends StatelessWidget {
  const ListViewBuildSpace({super.key, required this.spaceList});

  final List<SpaceModel> spaceList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text(
          spaceList.isNotEmpty ? spaceList[0].type : 'Spaces',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
        child: ListView.builder(
          itemCount: spaceList.length,
          itemBuilder: (context, index) {
            final space = spaceList[index];
            return ContainerBody(
              image: space.imageUrl,
              title: space.name,
              description: space.description,
              description2: space.instructorEmail,
              number: 5,
              capacity: space.capacity,
              // ✅ safely converted to double?
              onPressed:
                  space.isActive
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ReservationBuilderSpace(space: space),
                          ),
                        );
                      }
                      : () {},
              buttonColor: space.isActive ? colorScheme.surface : Colors.grey,
            );
          },
        ),
      ),
    );
  }
}

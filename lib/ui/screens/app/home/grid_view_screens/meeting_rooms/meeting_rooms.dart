import 'package:flutter/material.dart';
import 'package:vida/models/space_model.dart';
import 'package:vida/services/api_services/space_services.dart';
import 'package:vida/ui/components/common/loading.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/ListViewBuilder.dart';

class MeetingRooms extends StatelessWidget {
  const MeetingRooms({super.key});

  Future<List<SpaceModel>> _fetchMeetingRooms() async {
    final allSpaces = await SpaceServices().fetchSpace();
    return allSpaces
        .where((space) => space.type.toLowerCase() == 'meeting')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceModel>>(
      future: _fetchMeetingRooms(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingScreen());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No meeting rooms available.'));
        } else {
          return ListViewBuilder(spaceList: snapshot.data!);
        }
      },
    );
  }
}

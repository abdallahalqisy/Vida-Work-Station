import 'package:flutter/material.dart';
import 'package:vida/models/space_model.dart';
import 'package:vida/services/api_services/space_services.dart';
import 'package:vida/ui/components/common/loading.dart';
import 'package:vida/ui/components/common/list_view_builder/list_view_builder_space.dart';

class TrainingRooms extends StatelessWidget {
  const TrainingRooms({super.key});

  Future<List<SpaceModel>> _fetchTrainingRooms() async {
    final allSpaces = await SpaceServices().fetchSpace();
    return allSpaces
        .where((space) => space.type.toLowerCase() == 'training')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceModel>>(
      future: _fetchTrainingRooms(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingScreen());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No training rooms available.'));
        } else {
          return ListViewBuildSpace(spaceList: snapshot.data!);
        }
      },
    );
  }
}

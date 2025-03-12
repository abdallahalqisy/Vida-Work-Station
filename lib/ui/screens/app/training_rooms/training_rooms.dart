import 'package:flutter/material.dart';

class TrainingRooms extends StatelessWidget {
  const TrainingRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Training Rooms', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

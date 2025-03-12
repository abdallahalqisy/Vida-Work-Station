import 'package:flutter/material.dart';

class MeetingRooms extends StatelessWidget {
  const MeetingRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Meeting Rooms', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

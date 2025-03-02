import 'package:flutter/material.dart';
import 'package:vidaworkstation/features/home/home_screen.dart';

void main() {
  runApp(const VidaWorkStationApp());
}

class VidaWorkStationApp extends StatelessWidget {
  const VidaWorkStationApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

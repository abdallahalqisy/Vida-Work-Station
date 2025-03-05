import 'package:flutter/material.dart';

class TextInHomeScreen extends StatelessWidget {
  const TextInHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Welcome to the Vida Workstation',
        style: TextStyle(
          color: Color(0xff003367),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        'Vida workstation مش مجرد مكان, فيدا عبارة عن مكان يساعدك على النجاح وتحقيق اهدافك عن طريق:',
        textDirection: TextDirection.rtl,
      ),
    );
  }
}

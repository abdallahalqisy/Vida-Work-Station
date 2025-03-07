import 'package:flutter/material.dart';

class TextInHomeScreen extends StatelessWidget {
  const TextInHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Welcome to the Vida Workstation',
        style: TextStyle(
          color: Color(0xff003367),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            ' Vida workstation مش مجرد مكان, فيدا عبارة عن مكان يساعدك على النجاح وتحقيق اهدافك عن طريق:\n-توفير جو هادئ ومريح يساعد على التركيز للعمل والمذاكره\n-مكتبة بها مئات الكتب في مجالات مختلفة\n-منيو مختلف بأصناف متنوعة وبجوده عالية لتضبيط الموود\n-أماكن open air لكسر الروتين\n-قاعات اجتماعات VIP بأحجام مختلفة\n-قاعات تدريب بأعلى تجهيزات تساعد على العملية التعليمية\n-ورش عمل في مجالات مختلفة لنقل خبرات المدربين وأصحاب الشركات الى حديثى التخرج والطلاب\n',
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

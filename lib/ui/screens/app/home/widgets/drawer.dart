import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(radius: 25, child: Icon(Icons.person)),
                SizedBox(height: 10),
                Text(
                  'اسم المستخدم',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الرئيسيه'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('الاخبار'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            // leading: const Icon(Icons.confirmation_number),
            title: const Text('قاعات الاجتماعات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

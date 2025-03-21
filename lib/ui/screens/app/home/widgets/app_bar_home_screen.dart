import 'package:flutter/material.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/features/customer_services/customer_service_screen.dart';

class AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  // Implement PreferredSizeWidget
  const AppBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.support_agent, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerServiceScreen(),
              ),
            );
          },
        ),
      ],

      centerTitle: true,
      backgroundColor: colorScheme.surface,
      title: Image.asset('assets/images/logo.png', height: 30),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Define the preferred size
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vida/auth_cubit/auth_cubit.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/coming_events/coming_events.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/course/Courses.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/meeting_rooms/meeting_rooms.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/training_rooms/training_rooms.dart';
import 'package:vida/ui/screens/app/home/grid_view_screens/news_screen.dart';
import 'package:vida/ui/screens/onboarding/login_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserDataFromToken();
  }

  Future<void> _loadUserDataFromToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('displayName') ?? 'Guest User';
      userEmail = prefs.getString('email') ?? 'No email available';
    });

    log('Drawer loaded displayName: $userName');
    log('Drawer loaded email: $userEmail');
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? colorScheme.primary),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFFfefefe)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2395a6),
                      Color(0xFF4ac2d5), // اللون الأساسي

                      Color(0xFFa5e7ef), // أفتح من اللون الأساسي
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName ?? 'Guest User',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            userEmail ?? 'No email available',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              _buildDrawerItem(
                icon: Icons.school,
                title: 'قاعات التدريب',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainingRooms(),
                      ),
                    ),
              ),
              _buildDrawerItem(
                icon: Icons.emoji_events,
                title: 'Coming Events',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComingEvents(),
                      ),
                    ),
              ),
              _buildDrawerItem(
                icon: Icons.library_books,
                title: 'Courses',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Courses()),
                    ),
              ),
              _buildDrawerItem(
                icon: Icons.meeting_room,
                title: 'قاعات الاجتماعات',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MeetingRooms(),
                      ),
                    ),
              ),
              _buildDrawerItem(
                icon: Icons.newspaper,
                title: 'آخر الأخبار',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewsScreen(),
                      ),
                    ), // Add your functionality here
              ),

              const Divider(thickness: 1.5, indent: 16, endIndent: 16),

              _buildDrawerItem(
                icon: Icons.info,
                title: 'About',
                onTap: () => Navigator.pop(context),
              ),
              _buildDrawerItem(
                icon: Icons.contact_mail,
                title: 'Contact',
                onTap: () => Navigator.pop(context),
              ),

              const Spacer(),

              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: colorScheme.error,
                  size: 28,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('token');
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BlocProvider(
                              create: (context) => AuthCubit(),
                              child: LoginScreen(),
                            ),
                      ),
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

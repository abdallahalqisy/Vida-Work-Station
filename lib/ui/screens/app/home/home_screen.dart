import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vida/ui/screens/app/home/widgets/app_bar_home_screen.dart';
import 'package:vida/ui/screens/app/home/widgets/custom_list_view.dart';
import 'package:vida/ui/screens/app/home/widgets/grid_view_home_screen.dart';
import 'package:vida/ui/screens/app/home/widgets/text_in_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // تهيئة AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // تعريف الانيميشن للتكبير
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // تعريف الانيميشن للشفافية
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // تشغيل الانيميشن عند فتح الصفحة
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // دالة لفتح رابط الفيديو
  Future<void> _launchVideo() async {
    const videoUrl =
        'https://www.youtube.com/watch?v=j1NFgdVcIjI&t=5s&ab_channel=MostafaFathey';
    if (await canLaunch(videoUrl)) {
      await launch(videoUrl);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  'Vida Work Station',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: const AppBarHomeScreen(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _opacityAnimation.value,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Image.asset(
                              'assets/images/youtube_banner.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 60.h,
                      left: 155.w,
                      child: CircleAvatar(
                        radius: 35.r,
                        backgroundColor: Colors.blue.withOpacity(0.5),
                        child: IconButton(
                          onPressed: _launchVideo,
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const TextInHomeScreen(),
              GridViewInHomeScreen(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListTile(
                  title: const Text(
                    'احجز الان معنا اونلاين',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xff003367),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    'يمكنك الان الحجز من خلال الموقع الالكتروني ما عليك سوى اختيار القاعة التى تريد الحجز بها وتحديد معاد الحجز وارسال الطلب الينا وسوف نقوم فورا بتاكيد الحجز الخاص بك',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 250.h, child: CustomListView()),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

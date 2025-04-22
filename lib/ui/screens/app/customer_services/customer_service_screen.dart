import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';
import 'package:gif_view/gif_view.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  _CustomerServiceScreenState createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController();
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/67c7861c7c98a8190c588916/1ilhm7npd',
        visitor: TawkVisitor(
          name: 'Ayoub AMINE',
          email: 'ayoubamine2a@gmail.com',
        ),
        onLoad: () {
          log('Hello Tawk!');
        },
        onLinkTap: (String url) {
          log(url);
        },
        placeholder: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xff003367),
          child: Center(
            child: GifView.asset(
              'assets/images/loding.gif',
              controller: _gifController,
            ),
          ),
        ),
      ),
    );
  }
}
